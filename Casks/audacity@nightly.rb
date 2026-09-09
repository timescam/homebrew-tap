cask "audacity@nightly" do
  version :latest
  sha256 :no_check

  url "https://github.com/timescam/homebrew-tap/releases/download/audacity-nightly/audacity-macOS-nightly-arm64.dmg"
  name "Audacity"
  desc "Audio editor"
  homepage "https://www.audacityteam.org/beta/"

  conflicts_with cask: "audacity"

  app "Audacity.app"

  postflight_steps do
    if_path_exists "Audacity.app", base: :appdir do
      run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Audacity.app"]
    end
  end
end
