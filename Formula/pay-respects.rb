class PayRespects < Formula
  desc "CLI tool to pay respects"
  homepage "https://github.com/iffse/pay-respects"
  version "0.7.12"

  on_arm do
    url "https://github.com/iffse/pay-respects/releases/download/v0.7.12/pay-respects-0.7.12-aarch64-apple-darwin.tar.zst"
    sha256 "5e9d54695237bc47496005a3909f4b847f8233e6f27c22507c18b2bfc19d009a"
  end

  on_intel do
    url "https://github.com/iffse/pay-respects/releases/download/v0.7.12/pay-respects-0.7.12-x86_64-apple-darwin.tar.zst"
    sha256 "c6179a3616ec42a87b655952743a879e407c01576232a0a009ec16407647332f"
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
