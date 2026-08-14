class PayRespects < Formula
  desc "CLI tool to pay respects"
  homepage "https://github.com/iffse/pay-respects"
  version "0.8.8"

  on_arm do
    url "https://github.com/iffse/pay-respects/releases/download/v0.8.8/pay-respects-0.8.8-aarch64-apple-darwin.tar.zst"
    sha256 "e834e928dcaf9cd72a99478bb61e0630ba76e32c7b228eb3a7be9c5f404cd548"
  end

  on_intel do
    url "https://github.com/iffse/pay-respects/releases/download/v0.8.8/pay-respects-0.8.8-x86_64-apple-darwin.tar.zst"
    sha256 "64c30e1a62605279abf219193c53bf251687ea419a0c99d2e15ae8b5b6a58587"
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
