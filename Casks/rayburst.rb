cask "rayburst" do
  version "4.0.1"

  on_arm do
    sha256 "f4d1c40d7794dc7f42323001b472b2a722b168ace57e21074b9e780da883b3f2"

    url "https://github.com/AnInsomniacy/rayburst/releases/download/v#{version}/Rayburst_#{version}_aarch64.dmg"
  end
  on_intel do
    sha256 "2f2e1e56f7db4a5706600314d4a09893341043580281a36f4fa11ae7a94102f2"

    url "https://github.com/AnInsomniacy/rayburst/releases/download/v#{version}/Rayburst_#{version}_x64.dmg"
  end

  name "Rayburst"
  desc "Modern download manager rebuilt with Tauri"
  homepage "https://rayburst.pages.dev/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "Rayburst.app"

  postflight_steps do
    if_path_exists "Rayburst.app", base: :appdir do
      run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Rayburst.app"]
    end
  end
end
