class Zagi < Formula
  desc "A better git for agents"
  homepage "https://github.com/mattzcarey/zagi"
  version "0.1.8"

  on_arm do
    url "https://github.com/mattzcarey/zagi/releases/download/v#{version}/zagi-macos-aarch64.tar.gz"
    sha256 "81c7e26d3a54a057520ede0f74fc3dd0e1e8895d5dcbb314f6ab95b530396efd"
  end

  on_intel do
    url "https://github.com/mattzcarey/zagi/releases/download/v#{version}/zagi-macos-x86_64.tar.gz"
    sha256 "22cc2fb88be1de9e75a73d529df61986843dfb4b82e458a4977fd8dc4f71ef4a"
  end

  def install
    bin.install "zagi"
  end

  def caveats
    <<~EOS
      To use zagi as your git command, run:
        zagi alias
    EOS
  end

  test do
    system "#{bin}/zagi", "--version"
  end
end
