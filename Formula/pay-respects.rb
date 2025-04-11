class PayRespects < Formula
  desc "CLI tool to pay respects"
  homepage "https://github.com/iffse/pay-respects"
  version "0.7.5"

  on_arm do
    url "https://github.com/iffse/pay-respects/releases/download/v0.7.5/pay-respects-0.7.5-aarch64-apple-darwin.tar.zst"
    sha256 "297b970d67b05bee4b1b451727cd348b89ccc4a16575e73f3014dfcc578220cb"
  end

  on_intel do
    url "https://github.com/iffse/pay-respects/releases/download/v0.7.5/pay-respects-0.7.5-x86_64-apple-darwin.tar.zst"
    sha256 "e808fc2df9b1813f968d6d54621296f374f755d4ba9a85357d41523e39b5c546"
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
