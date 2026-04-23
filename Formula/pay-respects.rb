class PayRespects < Formula
  desc "CLI tool to pay respects"
  homepage "https://github.com/iffse/pay-respects"
  version "0.8.6"

  on_arm do
    url "https://github.com/iffse/pay-respects/releases/download/v0.8.6/pay-respects-0.8.6-aarch64-apple-darwin.tar.zst"
    sha256 "ca82953016e0b99749444321ce98b681214cbbb98f408695aa0eecbfdd6184bd"
  end

  on_intel do
    url "https://github.com/iffse/pay-respects/releases/download/v0.8.6/pay-respects-0.8.6-x86_64-apple-darwin.tar.zst"
    sha256 "86249af9ba430894a55cf550454fc31cb537bc1522be7c3aeebf5b183fb6aba2"
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
