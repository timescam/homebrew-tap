cask "rayburst" do
  version "4.1.0"

  on_arm do
    sha256 "94d10fb28b9cb0d02acd562ca45beba426d8f58dd777a492c5bdab5c73ea0d60"

    url "https://github.com/AnInsomniacy/rayburst/releases/download/v#{version}/Rayburst_#{version}_aarch64.dmg"
  end
  on_intel do
    sha256 "8e03ec541881a677b3a3c46101563bdaa83d850a1be983293897d904d26b4a58"

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
