cask "background-music@nightly" do
  version :latest
  sha256 :no_check

  url "https://github.com/timescam/homebrew-tap/releases/download/background-music-nightly/background-music-macOS-nightly-arm64.pkg"
  name "Background Music"
  desc "Audio utility: auto-pause music, per-app volume, record system audio"
  homepage "https://github.com/kyleneideck/BackgroundMusic"

  conflicts_with cask: "background-music"

  pkg "background-music-macOS-nightly-arm64.pkg"

  postflight_steps do
    if_path_exists "Background Music.app", base: :appdir do
      run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Background Music.app"]
    end
  end

  uninstall_postflight_steps do
    terminate_process "coreaudiod", sudo: true, must_succeed: true
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
    First run may require granting "microphone" access (virtual input for system audio).
    See: https://github.com/kyleneideck/BackgroundMusic#troubleshooting
  EOS
end
