class PayRespects < Formula
  desc "CLI tool to pay respects"
  homepage "https://github.com/iffse/pay-respects"
  version "0.6.9"

  if Hardware::CPU.arm?
    url "https://github.com/iffse/pay-respects/releases/download/v0.6.9/pay-respects-0.6.9-aarch64-apple-darwin.tar.zst"
    sha256 "1852904c1d16c34aadbab1a462be7f5751253171db7b724a6d64e64c9c5e56bd"
  else
    url "https://github.com/iffse/pay-respects/releases/download/v0.6.9/pay-respects-0.6.9-x86_64-apple-darwin.tar.zst"
    sha256 "fde11f2b32b938289d2376b8dfd8676c6cf564fcf6c47949e02e8943c3036bc0"
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
