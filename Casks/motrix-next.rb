cask "motrix-next" do
  version "3.9.9"

  on_arm do
    sha256 "3d5d7c6648c15712fd08b0ae390599e0cd523f951448e36d53ae8355e13ecd47"

    url "https://github.com/AnInsomniacy/motrix-next/releases/download/v#{version}/MotrixNext_#{version}_aarch64.dmg"
  end
  on_intel do
    sha256 "ae5b4a04aa26eb89baca774c87627b3d24c67c3fae364f475855e83ee9864106"

    url "https://github.com/AnInsomniacy/motrix-next/releases/download/v#{version}/MotrixNext_#{version}_x64.dmg"
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
