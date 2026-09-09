cask "motrix-next" do
  version "3.9.8"

  on_arm do
    sha256 "bae521515cdd283129d8945d0e229163e0d7750d478c0226e308de0818eff8f6"

    url "https://github.com/AnInsomniacy/motrix-next/releases/download/v#{version}/MotrixNext_#{version}_aarch64.dmg",
        verified: "github.com/AnInsomniacy/motrix-next/"
  end
  on_intel do
    sha256 "03a6809745ba9b1d09e4e0ca86bf1eaecfd8ecc3b048cf918317057b50fdb02b"

    url "https://github.com/AnInsomniacy/motrix-next/releases/download/v#{version}/MotrixNext_#{version}_x64.dmg",
        verified: "github.com/AnInsomniacy/motrix-next/"
  end

  name "Motrix Next"
  desc "Modern download manager rebuilt with Tauri"
  homepage "https://motrix-next.pages.dev/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "MotrixNext.app"

  postflight_steps do
    if_path_exists "MotrixNext.app", base: :appdir do
      run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/MotrixNext.app"]
    end
  end
end
