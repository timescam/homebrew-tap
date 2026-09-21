cask "boring-notch@nightly" do
  version "f6245e1-274"
  sha256 "3cbc6bec5e26436406d96768302d77eac86fa0ef1ce7aa0f8c8ddd307db35c0a"

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
