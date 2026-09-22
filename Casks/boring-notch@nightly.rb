cask "boring-notch@nightly" do
  version "73bfd54-275"
  sha256 "13f3ac27428d2325507143977c0faa82dbfaab2919f49516c52882f8abd7317b"

  url "https://github.com/TheBoredTeam/boring.notch/releases/download/nightly-dev-#{version}/boringNotch-dev-#{version}.dmg"
  name "Boring Notch"
  desc "Notch overlay: media, calendar, HUD (nightly build)"
  homepage "https://github.com/TheBoredTeam/boring.notch"

  livecheck do
    url :url
    regex(/nightly-dev-(\h+-\d+)/i)
    strategy :github_releases do |json, regex|
      json.filter_map do |release|
        next if release["draft"]

        match = release["tag_name"]&.match(regex)
        match[1] if match
      end
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
