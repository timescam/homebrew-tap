class PayRespects < Formula
  desc "CLI tool to pay respects"
  homepage "https://github.com/iffse/pay-respects"
  version "0.7.9"

  on_arm do
    url "https://github.com/iffse/pay-respects/releases/download/v0.7.9/pay-respects-0.7.9-aarch64-apple-darwin.tar.zst"
    sha256 "20c1539e30baf09585cdd0fd71e3f8e428f01004e91aa6df635c9d0c360ea895"
  end

  on_intel do
    url "https://github.com/iffse/pay-respects/releases/download/v0.7.9/pay-respects-0.7.9-x86_64-apple-darwin.tar.zst"
    sha256 "7044b984bbf31698cd07065d70cf1f7adc30e5501a157dae9d7f80ff8d7310fc"
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
