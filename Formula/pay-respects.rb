class PayRespects < Formula
  desc "CLI tool to pay respects"
  homepage "https://github.com/iffse/pay-respects"
  version "0.7.6"

  on_arm do
    url "https://github.com/iffse/pay-respects/releases/download/v0.7.6/pay-respects-0.7.6-aarch64-apple-darwin.tar.zst"
    sha256 "08fd0f83aa9bc4891710a8b0914d964c4be78c38e124300897891941ebc83de6"
  end

  on_intel do
    url "https://github.com/iffse/pay-respects/releases/download/v0.7.6/pay-respects-0.7.6-x86_64-apple-darwin.tar.zst"
    sha256 "5d446d8338da3ccf33da0ac2ab57d0628adb080acdc0b8644840e63cdfeb41ee"
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
