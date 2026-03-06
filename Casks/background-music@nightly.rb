cask "background-music@nightly" do
  version :latest
  sha256 :no_check

  url "https://github.com/timescam/homebrew-tap/releases/download/background-music-nightly/background-music-macOS-nightly-arm64.pkg"
  name "Background Music"
  desc "macOS audio utility: auto-pause music, per-app volume, record system audio"
  homepage "https://github.com/kyleneideck/BackgroundMusic"

  pkg "background-music-macOS-nightly-arm64.pkg"

  app "Background Music.app"

  uninstall pkgutil: "com.bearisdriving.BGM"

  caveats <<~EOS
    This build is unsigned. After install run:
      xattr -d com.apple.quarantine /Applications/Background\\ Music.app
    First run may require granting "microphone" access (virtual input for system audio).
    See: https://github.com/kyleneideck/BackgroundMusic#troubleshooting
  EOS
end
