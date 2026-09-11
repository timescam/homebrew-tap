#!/usr/bin/env bash
set -euo pipefail

pkg="$1"
name="${TAP_NAME:?}/${pkg}"
json="$(brew livecheck --json "${name}")"
current="$(jq -r '.[0].version.current // empty' <<<"${json}")"
latest="$(jq -r '.[0].version.latest // empty' <<<"${json}")"

if [[ -z "${latest}" || "${latest}" == "${current}" ]]; then
  echo "${pkg} is up to date (${current})"
  exit 0
fi

path="$(brew ruby -- -e "require 'formula'; puts Formula['${name}'].path")"

url_from_block() {
  python3 -c '
import re, sys
src = open(sys.argv[1]).read()
block, version = sys.argv[2], sys.argv[3]
m = re.search(rf"{re.escape(block)} do\s+url \"([^\"]+)\"", src, re.S)
if m:
    print(m.group(1).replace("#{version}", version))
' "$1" "$2" "$3"
}

sha_for() {
  curl -fsSL "$1" | shasum -a 256 | awk '{print $1}'
}

python3 -c '
import re, sys
path, current, latest = sys.argv[1:]
src = open(path).read()
src, n = re.subn(
    rf"version \"{re.escape(current)}\"",
    f"version \"{latest}\"",
    src,
    count=1,
)
if n != 1:
    raise SystemExit("could not replace version")
open(path, "w").write(src)
' "${path}" "${current}" "${latest}"

for block in on_arm on_intel; do
  url="$(url_from_block "${path}" "${block}" "${latest}")"
  [[ -z "${url}" ]] && continue
  echo "Fetching ${url}"
  sha="$(sha_for "${url}")"
  python3 -c '
import re, sys
path, block, sha = sys.argv[1:]
src = open(path).read()
src, n = re.subn(
    rf"({re.escape(block)} do\s+url \"[^\"]+\"\s+sha256 \")[0-9a-f]+(\")",
    rf"\g<1>{sha}\2",
    src,
    count=1,
    flags=re.S,
)
if n != 1:
    raise SystemExit(f"could not replace sha256 in {block}")
open(path, "w").write(src)
' "${path}" "${block}" "${sha}"
done

repo_root="$(cd "$(dirname "${path}")/.." && pwd)"
branch="bump-${pkg}-${latest}"
git -C "${repo_root}" checkout -B "${branch}"
git -C "${repo_root}" add "${path}"
git -C "${repo_root}" commit -m "${pkg} ${latest}"
git -C "${repo_root}" push -u "https://x-access-token:${HOMEBREW_GITHUB_API_TOKEN}@github.com/${GITHUB_REPOSITORY}.git" "${branch}"
gh pr create --repo "${GITHUB_REPOSITORY}" --head "${branch}" --title "${pkg} ${latest}" --body "Created by autobump."
