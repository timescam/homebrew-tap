cask "boring-notch@nightly" do
  version "2026.09.24.03.39.23.839bdf0"
  sha256 "21cdca9317d3c27d5e8e46e554a311e53b6dd2bf30fa4726d8c20c1e66caeb8a"

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

  app "boringNotch.app"

  postflight_steps do
    if_path_exists "boringNotch.app", base: :appdir do
      run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/boringNotch.app"]
    end
  end

  uninstall quit: "theboringteam.boringnotch"

  zap trash: [
    "~/Library/Application Scripts/theboringteam.boringnotch/",
    "~/Library/Containers/TheBoringNotch/",
    "~/Library/Containers/theboringteam.boringnotch/",
  ]
end
