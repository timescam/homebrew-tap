cask "rayburst" do
  version "4.1.2"

  on_arm do
    sha256 "ed54a1d1bf0d4b0819aa24c7ee4c662f5e1e1e4555ef48f8e6299a3ea8cc6d1c"

    url "https://github.com/AnInsomniacy/rayburst/releases/download/v#{version}/Rayburst_#{version}_aarch64.dmg"
  end
  on_intel do
    sha256 "c9892990659893bba7737eb68daf801864a861e8e180f3ef9987ebeb3c9f1c8a"

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
