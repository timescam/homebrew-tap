class Spotatui < Formula
  desc "Spotify client for the terminal (Rust TUI, native streaming)"
  homepage "https://github.com/LargeModGames/spotatui"
  version "0.37.1"

  on_arm do
    url "https://github.com/LargeModGames/spotatui/releases/download/v#{version}/spotatui-macos-aarch64.tar.gz"
    sha256 "5a384a0a6b90ce4efd19f3aaa7f92990ccb2970a5982c31de70a739ae75add76"
  end

  on_intel do
    url "https://github.com/LargeModGames/spotatui/releases/download/v#{version}/spotatui-macos-x86_64.tar.gz"
    sha256 "2f80bb05600be4a1fff96b62592d7690e2ad745429dd85f976554e86323d6bde"
  end

  def install
    bin.install "spotatui"
  end

  test do
    system "#{bin}/spotatui", "--version"
  end
end
