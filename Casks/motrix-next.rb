cask "motrix-next" do
  version "3.8.9"

  on_arm do
    sha256 "46b867eb055a70b9ab47ab188f11a4d6535dc7dd92e5c8511da592206ee0a435"

    url "https://github.com/AnInsomniacy/motrix-next/releases/download/v#{version}/MotrixNext_#{version}_aarch64.dmg",
        verified: "github.com/AnInsomniacy/motrix-next/"
  end
  on_intel do
    sha256 "b41ba69bba220f82b205c82100f80976d2d5c00378707b5ed18184f6dd44db51"

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

  app "MotrixNext.app"

  postflight do
    app_path = appdir/"MotrixNext.app"
    next unless app_path.exist?

    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", app_path]
  end
end
