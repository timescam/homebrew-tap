class PayRespects < Formula
  desc "CLI tool to pay respects"
  homepage "https://github.com/iffse/pay-respects"
  version "0.8.3"

  on_arm do
    url "https://github.com/iffse/pay-respects/releases/download/v0.8.3/pay-respects-0.8.3-aarch64-apple-darwin.tar.zst"
    sha256 "dd31b0738d8130bd95b318e6ca834332021f70711513077035c84ed2fadef90c"
  end

  on_intel do
    url "https://github.com/iffse/pay-respects/releases/download/v0.8.3/pay-respects-0.8.3-x86_64-apple-darwin.tar.zst"
    sha256 "3784af5fd84a1f719d7cbe486d5097e57f6d054ba5450dff872efa9e848d6a18"
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
