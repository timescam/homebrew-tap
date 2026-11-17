cask "music-lyric-app" do
  arch arm: "arm64", intel: "x64"

  version "8.0"
  sha256 arm:   "a3f4bf5cf66ed99370fc80d4fde18d0dcc9aece31620cbdbd8eeb373aebced60",
         intel: "ddcaea224a53181ce4bd237ff7c69627a70994d16398fa8a00876926c9858924"

  # shortcut: assets are MusicLyricApp-#{version}.0, tags stay v#{version}; change if they match
  url "https://github.com/jitwxs/163MusicLyrics/releases/download/v#{version}/MusicLyricApp-#{version}.0-osx-#{arch}.tar.gz"
  name "MusicLyricApp"
  desc "NetEase Cloud and QQ Music lyrics tool"
  homepage "https://github.com/jitwxs/163MusicLyrics"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :monterey

  app "MusicLyricApp-#{version}.0-osx-#{arch}.app", target: "MusicLyricApp.app"
end
