cask "aerospace@nightly" do
  version :latest
  sha256 :no_check

  url "https://github.com/timescam/homebrew-tap/releases/download/aerospace-nightly/AeroSpace-vnightly.zip"
  name "AeroSpace"
  desc "I3-like tiling window manager (nightly build)"
  homepage "https://github.com/nikitabobko/AeroSpace"

  conflicts_with cask: "aerospace"
  depends_on macos: :ventura

  app "AeroSpace-vnightly/AeroSpace.app"
  binary "AeroSpace-vnightly/bin/aerospace"

  postflight do
    app_path = appdir/"AeroSpace.app"
    next unless app_path.exist?

    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", app_path]
  end

  zap trash: [
    "~/.aerospace.toml",
    "~/Library/Application Support/AeroSpace",
    "~/Library/Caches/AeroSpace",
    "~/Library/HTTPStorages/bobko.nikita.aerospace",
    "~/Library/Logs/AeroSpace",
    "~/Library/Preferences/bobko.nikita.aerospace.plist",
    "~/Library/Saved Application State/bobko.nikita.aerospace.savedState",
  ]
end
