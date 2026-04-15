cask "motrix-next" do
  version "3.6.10"

  on_arm do
    sha256 "1dcee8a2d69cbc72ae4a5f96c3cd001819f7996eb511c258948cb04880a5564e"

    url "https://github.com/AnInsomniacy/motrix-next/releases/download/v#{version}/MotrixNext_#{version}_aarch64.dmg",
        verified: "github.com/AnInsomniacy/motrix-next/"
  end
  on_intel do
    sha256 "129a707cba9745b85f93592c0cad4ab879f1e1e1a04af99f2017cd190adfa98e"

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
