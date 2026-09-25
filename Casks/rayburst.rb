cask "rayburst" do
  version "4.0.0"

  on_arm do
    sha256 "5be9d15703203d2a40e0d507dbe29c5cd0f70dd35d1207ec28abf35e538936a1"

    url "https://github.com/AnInsomniacy/rayburst/releases/download/v#{version}/Rayburst_#{version}_aarch64.dmg"
  end
  on_intel do
    sha256 "e940b17fc37b15779e18dcf3440820520bf75e91218886cb699b21beb59e28cd"

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
