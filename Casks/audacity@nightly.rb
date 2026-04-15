cask "audacity@nightly" do
  version :latest
  sha256 :no_check

  url "https://github.com/timescam/homebrew-tap/releases/download/audacity-nightly/audacity-macOS-nightly-arm64.dmg"
  name "Audacity"
  desc "Audio editor"
  homepage "https://www.audacityteam.org/beta/"

  conflicts_with cask: "audacity"

  app "Audacity.app"

  postflight do
    app_path = appdir/"Audacity.app"
    next unless app_path.exist?

    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", app_path]
  end
end
