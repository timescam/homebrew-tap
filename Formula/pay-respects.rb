class PayRespects < Formula
  desc "CLI tool to pay respects"
  homepage "https://github.com/iffse/pay-respects"
  version "0.7.11"

  on_arm do
    url "https://github.com/iffse/pay-respects/releases/download/v0.7.11/pay-respects-0.7.11-aarch64-apple-darwin.tar.zst"
    sha256 "297bb9f1a40ad9655bd818b5a73d0a68e355696425968cfb7cf56fb29d89fd5b"
  end

  on_intel do
    url "https://github.com/iffse/pay-respects/releases/download/v0.7.11/pay-respects-0.7.11-x86_64-apple-darwin.tar.zst"
    sha256 "d2af0b18a93626a5d36a2d7d500e259339a93286832c5870e72105f82826ec70"
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
