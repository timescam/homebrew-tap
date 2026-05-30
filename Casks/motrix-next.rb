cask "motrix-next" do
  version "3.9.2"

  on_arm do
    sha256 "a09b9e91884876f8255e90651b00b71ab17c2f2b852705a59a917130615c6dc1"

    url "https://github.com/AnInsomniacy/motrix-next/releases/download/v#{version}/MotrixNext_#{version}_aarch64.dmg",
        verified: "github.com/AnInsomniacy/motrix-next/"
  end
  on_intel do
    sha256 "6752a3ea58e5edec84aca564e61e292549d681481cf55f1c1e235e3d034349ce"

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
