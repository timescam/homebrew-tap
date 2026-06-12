class Spotatui < Formula
  desc "Spotify client for the terminal (Rust TUI, native streaming)"
  homepage "https://github.com/LargeModGames/spotatui"
  version "0.39.1"

  on_arm do
    url "https://github.com/LargeModGames/spotatui/releases/download/v#{version}/spotatui-macos-aarch64.tar.gz"
    sha256 "c95651b45b85eb43800d63d63d1b5595e4caf55a683194d0a02ed41f29970956"
  end

  on_intel do
    url "https://github.com/LargeModGames/spotatui/releases/download/v#{version}/spotatui-macos-x86_64.tar.gz"
    sha256 "874e4c96997b619beaef67abc29b82f6aba8e703bc4ebd7c65796d788b5d00b1"
  end

  def install
    bin.install "spotatui"
  end

  test do
    system "#{bin}/spotatui", "--version"
  end
end
