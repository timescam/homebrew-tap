class PayRespects < Formula
  desc "CLI tool to pay respects"
  homepage "https://github.com/iffse/pay-respects"
  version "0.6.11"

  on_arm do
    url "https://github.com/iffse/pay-respects/releases/download/v0.6.10/pay-respects-0.6.10-aarch64-apple-darwin.tar.zst"
    sha256 "bd3c6269e56061ccbcba0fd763562b07cc18810510cc00c1451b789dfbcfe713"
  end

  on_intel do
    url "https://github.com/iffse/pay-respects/releases/download/v0.6.10/pay-respects-0.6.10-x86_64-apple-darwin.tar.zst"
    sha256 "941c2823507fb9535a0e37722670170809a06aa2286f329e5e81bb17a22e265c"
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
