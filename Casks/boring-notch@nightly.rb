cask "boring-notch@nightly" do
  version "2026.10.15.03.25.00.a41da2a"
  sha256 "7b5c6edb8151431a4a1f0da5ec7a67b98ba920e1c63d063482034cb4fbc2474a"

  # Rolling tag; query keeps the URL versioned so bump can refresh the sha256.
  url "https://github.com/TheBoredTeam/boring.notch/releases/download/nightly/boringNotch-nightly.dmg?v=#{version}"
  name "Boring Notch"
  desc "Notch overlay: media, calendar, HUD (nightly build)"
  homepage "https://github.com/TheBoredTeam/boring.notch"

  livecheck do
    url :url
    regex(/Commit:\s+(\h+)/i)
    strategy :github_releases do |json, regex|
      release = json.find { |r| r["tag_name"] == "nightly" && !r["draft"] }
      next unless release

      updated = release["assets"]&.find { |asset| asset["name"] == "boringNotch-nightly.dmg" }&.[]("updated_at")
      next unless updated

      stamp = updated[0, 19].tr("-T:", "...")
      commit = release["body"]&.[](regex, 1)
      [commit ? "#{stamp}.#{commit}" : stamp]
    end
  end

  conflicts_with cask: [
    "boring-notch",
    "boring-notch@rc",
  ]
  depends_on macos: :sonoma

  app "Boring Notch.app"

  postflight_steps do
    if_path_exists "Boring Notch.app", base: :appdir do
      run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Boring Notch.app"]
    end
  end

  uninstall quit: "theboringteam.boringnotch"

  zap trash: [
    "~/Library/Application Scripts/theboringteam.boringnotch/",
    "~/Library/Containers/TheBoringNotch/",
    "~/Library/Containers/theboringteam.boringnotch/",
  ]
end
