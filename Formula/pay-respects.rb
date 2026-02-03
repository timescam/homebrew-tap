class PayRespects < Formula
  desc "CLI tool to pay respects"
  homepage "https://github.com/iffse/pay-respects"
  version "0.7.10"

  on_arm do
    url "https://github.com/iffse/pay-respects/releases/download/v0.7.10/pay-respects-0.7.10-aarch64-apple-darwin.tar.zst"
    sha256 "7f6cafd66371f44e77f321e6543ad4ce8b4ffedb20282e2778ada512e7e0c825"
  end

  on_intel do
    url "https://github.com/iffse/pay-respects/releases/download/v0.7.10/pay-respects-0.7.10-x86_64-apple-darwin.tar.zst"
    sha256 "d973fdb18eed4cd80bb5eb6289e780f1d5a0d24616ce9facc9ae8fc0c7fd26b5"
  end

  def install
    bin.install "pay-respects"
    # Install required modules
    bin.install "_pay-respects-module-100-runtime-rules"
    bin.install "_pay-respects-fallback-100-request-ai"
  end

  test do
    system "#{bin}/pay-respects", "--version"
  end
end
