class Pokeget < Formula
  desc "A command line utility to display pokemon sprites in the terminal"
  homepage "https://github.com/talwat/pokeget-rs"
  version "null"

  on_arm do
    url "https://github.com/talwat/pokeget-rs/releases/download/#{version}/pokeget-macOS-aarch64.tar.gz"
    sha256 "Not"
  end

  on_intel do
    url "https://github.com/talwat/pokeget-rs/releases/download/#{version}/pokeget-macOS-x86_64.tar.gz"
    sha256 "Not"
  end

  def install
    bin.install "pokeget"
  end

  test do
    system "#{bin}/pokeget", "--version"
  end
end 