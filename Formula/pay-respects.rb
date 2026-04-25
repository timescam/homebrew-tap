class PayRespects < Formula
  desc "CLI tool to pay respects"
  homepage "https://github.com/iffse/pay-respects"
  version "0.8.7"

  on_arm do
    url "https://github.com/iffse/pay-respects/releases/download/v0.8.7/pay-respects-0.8.7-aarch64-apple-darwin.tar.zst"
    sha256 "c9e31dfd6d541294f7120100d678083b1bb9e61dc7b2d2257ac6ea8b4df34738"
  end

  on_intel do
    url "https://github.com/iffse/pay-respects/releases/download/v0.8.7/pay-respects-0.8.7-x86_64-apple-darwin.tar.zst"
    sha256 "9ccd3634941ae392124984160af20cb66e851d5cc8a12fd6a472634224a957da"
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
