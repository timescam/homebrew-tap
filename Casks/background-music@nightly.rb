cask "background-music@nightly" do
  version :latest
  sha256 :no_check

  url "https://github.com/timescam/homebrew-tap/releases/download/background-music-nightly/background-music-macOS-nightly-arm64.pkg"
  name "Background Music"
  desc "macOS audio utility: auto-pause music, per-app volume, record system audio"
  homepage "https://github.com/kyleneideck/BackgroundMusic"
  conflicts_with cask: "background-music"

  pkg "background-music-macOS-nightly-arm64.pkg"

  uninstall_postflight do
    system_command "/usr/bin/killall",
                   args:         ["coreaudiod"],
                   sudo:         true,
                   must_succeed: true
  end

  uninstall launchctl: "com.bearisdriving.BGM.XPCHelper",
            quit:      "com.bearisdriving.BGM.App",
            pkgutil:   "com.bearisdriving.BGM",
            delete:    [
              "/Library/Application Support/Background Music",
              "/Library/Audio/Plug-Ins/HAL/Background Music Device.driver",
              "/usr/local/libexec/BGMXPCHelper.xpc",
            ]

  zap trash: [
    "/Library/LaunchDaemons/com.bearisdriving.BGM.XPCHelper.plist",
    "~/Library/Preferences/com.bearisdriving.BGM.App.plist",
  ]

  caveats <<~EOS
    This build is unsigned. After install run:
      xattr -d com.apple.quarantine /Applications/Background\\ Music.app
    First run may require granting "microphone" access (virtual input for system audio).
    See: https://github.com/kyleneideck/BackgroundMusic#troubleshooting
  EOS
end
