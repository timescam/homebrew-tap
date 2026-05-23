class Spotatui < Formula
  desc "Spotify client for the terminal (Rust TUI, native streaming)"
  homepage "https://github.com/LargeModGames/spotatui"
  version "0.38.3"

  on_arm do
    url "https://github.com/LargeModGames/spotatui/releases/download/v#{version}/spotatui-macos-aarch64.tar.gz"
    sha256 "3b6c5e51762588f0eb62ea6bcea549aba06f95b9d43db707b2eb90b62641ed34"
  end

  on_intel do
    url "https://github.com/LargeModGames/spotatui/releases/download/v#{version}/spotatui-macos-x86_64.tar.gz"
    sha256 "708e0c1b50c995a490af4851d9dec581187fac2a8e71ef23885ef13b5b5de37e"
  end

  def install
    bin.install "spotatui"
  end

  test do
    system "#{bin}/spotatui", "--version"
  end
end
