class Zagi < Formula
  desc "A better git for agents"
  homepage "https://github.com/mattzcarey/zagi"
  version "0.2.0"

  on_arm do
    url "https://github.com/mattzcarey/zagi/releases/download/v#{version}/zagi-macos-aarch64.tar.gz"
    sha256 "3cc13025170768c452f82c189329101748ccce597a0e4e80f37975eaac4e0d25"
  end

  on_intel do
    url "https://github.com/mattzcarey/zagi/releases/download/v#{version}/zagi-macos-x86_64.tar.gz"
    sha256 "929b035210ee79e174857ae27022c8637aa0d94e338f05d6ba87c946c9090308"
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
