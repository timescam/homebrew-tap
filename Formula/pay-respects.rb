class PayRespects < Formula
  desc "CLI tool to pay respects"
  homepage "https://github.com/iffse/pay-respects"
  version "0.8.1"

  on_arm do
    url "https://github.com/iffse/pay-respects/releases/download/v0.8.1/pay-respects-0.8.1-aarch64-apple-darwin.tar.zst"
    sha256 "64a777f9a1ec8d0ffd63e45600d242e6447e2c05d565d39ceccc984147d80d69"
  end

  on_intel do
    url "https://github.com/iffse/pay-respects/releases/download/v0.8.1/pay-respects-0.8.1-x86_64-apple-darwin.tar.zst"
    sha256 "2c0e9e1b6f936e54ebbbf8b810a746e86cb420d972b760ff0fcea8aa55b71868"
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
