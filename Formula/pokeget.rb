class Pokeget < Formula
  desc "A command line utility to display pokemon sprites in the terminal"
  homepage "https://github.com/talwat/pokeget-rs"
  version "1.6.3"

  on_arm do
    url "https://github.com/talwat/pokeget-rs/releases/download/#{version}/pokeget-macOS-aarch64.tar.gz"
    sha256 "db0db6139d6a2ab208e4080537caf5f0661a94eaef38ffe1a1d93ddb1dd625c1"
  end

  on_intel do
    url "https://github.com/talwat/pokeget-rs/releases/download/#{version}/pokeget-macOS-x86_64.tar.gz"
    sha256 "f2157996dd15270a3a2a9c35212bda31c48017ad2625c643e207c3c6942dac60"
  end

  def install
    bin.install "pokeget"
  end

  test do
    system "#{bin}/pokeget", "--version"
  end
end 