cask "audacity@nightly" do
  version :latest
  sha256 :no_check

  url "https://github.com/timescam/homebrew-tap/releases/download/audacity-nightly/audacity-macOS-nightly-arm64.dmg"
  name "Audacity"
  desc "Audio editor"
  homepage "https://www.audacityteam.org/beta/"
  conflicts_with cask: "audacity"

  app "Audacity.app"

  caveats <<~EOS
    This build isn't signed; install with `--no-quarantine`, or after install run:
    xattr -d com.apple.quarantine /Applications/Audacity.app
    read more: https://support.apple.com/en-us/102445
  EOS
end