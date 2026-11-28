cask "rayburst" do
  version "4.1.3"

  on_arm do
    sha256 "4f82b8479475d955db0a1f145d6194e801f3edf8d45afb3a68f49fc4c09f8c1b"

    url "https://github.com/AnInsomniacy/rayburst/releases/download/v#{version}/Rayburst_#{version}_aarch64.dmg"
  end
  on_intel do
    sha256 "6bb9870545bd692643ab83f9b8a97d454181711664aa9fd058fbb44d40067855"

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
