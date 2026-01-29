class Zagi < Formula
  desc "A better git for agents"
  homepage "https://github.com/mattzcarey/zagi"
  version "0.1.7"

  on_arm do
    url "https://github.com/mattzcarey/zagi/releases/download/v#{version}/zagi-macos-aarch64.tar.gz"
    sha256 "a38e24624d4970cc038df861715e212c4e4fc18339b7b909c29257a4ebaa81d8"
  end

  on_intel do
    url "https://github.com/mattzcarey/zagi/releases/download/v#{version}/zagi-macos-x86_64.tar.gz"
    sha256 "674cede2084627089c865fe735010d3d3a1ecce9002c267e4f43158d6e7d0bd1"
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
