class Spotatui < Formula
  desc "Spotify client for the terminal (Rust TUI, native streaming)"
  homepage "https://github.com/LargeModGames/spotatui"
  version "0.45.0"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  on_arm do
    url "https://github.com/LargeModGames/spotatui/releases/download/v#{version}/spotatui-macos-aarch64.tar.gz"
    sha256 "9b81db4c3904080e20a74ba5376320c1d0f000d033bf64ee89a2a497d68d9d0b"
  end

  on_intel do
    url "https://github.com/LargeModGames/spotatui/releases/download/v#{version}/spotatui-macos-x86_64.tar.gz"
    sha256 "2b022a43487c9c6a6ee9c02ee5147c9725f2cce23b6c3396e88dcf21ba6ae50e"
  end

  def install
    bin.install "spotatui"
  end

  test do
    system "#{bin}/spotatui", "--version"
  end
end
