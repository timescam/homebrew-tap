cask "music-lyric-app" do
  arch arm: "arm64", intel: "x64"

  version "7.3"
  sha256 arm:   "7b85bf39297c6b2aa328ae15e15c4c9e3a3ae4eae2c09cb9f47d49f46c806f42",
         intel: "0c5ff2eae08015a04bdcb2b1025326028a1235e250d2f9bcfc5aa484963b7461"

  url "https://github.com/jitwxs/163MusicLyrics/releases/download/v#{version}/MusicLyricApp-v#{version}-osx-#{arch}.tar.gz",
      verified: "github.com/jitwxs/163MusicLyrics/"
  name "MusicLyricApp"
  desc "NetEase Cloud and QQ Music lyrics tool"
  homepage "https://github.com/jitwxs/163MusicLyrics"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "MusicLyricApp-v#{version}-osx-#{arch}.app", target: "MusicLyricApp.app"
end
