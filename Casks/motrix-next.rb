cask "motrix-next" do
  version "3.8.2"

  on_arm do
    sha256 "a62c57c6c98be07f71e1575a1dca3a9e51df70428989b80c7b7e5c1b072f30ad"

    url "https://github.com/AnInsomniacy/motrix-next/releases/download/v#{version}/MotrixNext_#{version}_aarch64.dmg",
        verified: "github.com/AnInsomniacy/motrix-next/"
  end
  on_intel do
    sha256 "29a34d4bbf0fa1ca003581f4e61acc029c635a6c4fe937ce7deafa8953b3a70b"

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
