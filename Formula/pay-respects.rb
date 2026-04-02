class PayRespects < Formula
  desc "CLI tool to pay respects"
  homepage "https://github.com/iffse/pay-respects"
  version "0.8.0"

  on_arm do
    url "https://github.com/iffse/pay-respects/releases/download/v0.8.0/pay-respects-0.8.0-aarch64-apple-darwin.tar.zst"
    sha256 "d2943b977855f2c94781ca697c21f50cebd3de6309e6a1b6d38e70c6d9173d56"
  end

  on_intel do
    url "https://github.com/iffse/pay-respects/releases/download/v0.8.0/pay-respects-0.8.0-x86_64-apple-darwin.tar.zst"
    sha256 "97132ef20b14f2e637ad7fb93948b6025fe19b5b300bb39a9d653b326a349398"
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
