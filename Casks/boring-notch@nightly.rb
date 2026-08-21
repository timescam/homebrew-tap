cask "boring-notch@nightly" do
  version :latest
  sha256 :no_check

  url "https://github.com/timescam/homebrew-tap/releases/download/boring-notch-nightly/boringNotch-nightly.zip"
  name "Boring Notch"
  desc "Notch overlay: media, calendar, HUD (nightly build)"
  homepage "https://github.com/TheBoredTeam/boring.notch"

  conflicts_with cask: [
    "boring-notch",
    "boring-notch@rc",
  ]
  depends_on macos: :sonoma

  app "boringNotch.app"

  postflight do
    app_path = appdir/"boringNotch.app"
    next unless app_path.exist?

    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", app_path]
  end

  uninstall quit: "theboringteam.boringnotch"

  zap trash: [
    "~/Library/Application Scripts/theboringteam.boringnotch/",
    "~/Library/Containers/TheBoringNotch/",
    "~/Library/Containers/theboringteam.boringnotch/",
  ]
end
