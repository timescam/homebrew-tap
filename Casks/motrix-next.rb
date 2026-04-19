cask "motrix-next" do
  version "3.7.2"

  on_arm do
    sha256 "0cdbd1144fc51cb1546ea38faaad3311795d6dadf43d8097786c013fd97e7f5e"

    url "https://github.com/AnInsomniacy/motrix-next/releases/download/v#{version}/MotrixNext_#{version}_aarch64.dmg",
        verified: "github.com/AnInsomniacy/motrix-next/"
  end
  on_intel do
    sha256 "67a43072e8bfe939745bf442441181c2163a725118870b9edbd8bf2f770b9b8f"

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
