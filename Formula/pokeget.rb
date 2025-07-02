class Pokeget < Formula
  desc "A command line utility to display pokemon sprites in the terminal"
  homepage "https://github.com/talwat/pokeget-rs"
  version "1.6.5"

  on_arm do
    url "https://github.com/talwat/pokeget-rs/releases/download/#{version}/pokeget-macOS-aarch64.tar.gz"
    sha256 "2e524bde1df6f73f3130add15f25d3bcf67083a2f2609b3d8b686ef9be65fa5d"
  end

  on_intel do
    url "https://github.com/talwat/pokeget-rs/releases/download/#{version}/pokeget-macOS-x86_64.tar.gz"
    sha256 "ae2b903ec4e452f1eea953646bfe4aee2e05d6078150f2a292d58bb40b075feb"
  end

  def install
    bin.install "pokeget"
  end

  test do
    system "#{bin}/pokeget", "--version"
  end
end 