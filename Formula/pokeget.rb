class Pokeget < Formula
  desc "A command line utility to display pokemon sprites in the terminal"
  homepage "https://github.com/talwat/pokeget-rs"
  version "1.6.7"

  on_arm do
    url "https://github.com/talwat/pokeget-rs/releases/download/#{version}/pokeget-macOS-aarch64.tar.gz"
    sha256 "0bf716d188e1d226778568ddd6d9f832a124db4490f0da256d53788634f2e544"
  end

  on_intel do
    url "https://github.com/talwat/pokeget-rs/releases/download/#{version}/pokeget-macOS-x86_64.tar.gz"
    sha256 "f5813f93d131c9d04bc4326dc35198e63fe9b631d024c883d140d00920ddd9d7"
  end

  def install
    bin.install "pokeget"
  end

  test do
    system "#{bin}/pokeget", "--version"
  end
end 