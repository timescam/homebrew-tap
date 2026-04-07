class PayRespects < Formula
  desc "CLI tool to pay respects"
  homepage "https://github.com/iffse/pay-respects"
  version "0.8.5"

  on_arm do
    url "https://github.com/iffse/pay-respects/releases/download/v0.8.5/pay-respects-0.8.5-aarch64-apple-darwin.tar.zst"
    sha256 "38c1fc85f42a35adbdaee3d8b1828abbdfec2f9f711937dea36363290bb1d468"
  end

  on_intel do
    url "https://github.com/iffse/pay-respects/releases/download/v0.8.5/pay-respects-0.8.5-x86_64-apple-darwin.tar.zst"
    sha256 "6a56881816e630f73eaf4dac92ef113145b337ee66c59b9da0b09201eedf71f4"
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
