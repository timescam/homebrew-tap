cask "boring-notch@nightly" do
  version "2026.10.10.03.28.53.1fa326d"
  sha256 "a009db6a1b2ea7b3513fab61f4b1cba9f67af94953891c2719f0d970a1521f95"

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
