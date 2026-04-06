class PayRespects < Formula
  desc "CLI tool to pay respects"
  homepage "https://github.com/iffse/pay-respects"
  version "0.8.4"

  on_arm do
    url "https://github.com/iffse/pay-respects/releases/download/v0.8.4/pay-respects-0.8.4-aarch64-apple-darwin.tar.zst"
    sha256 "0375b3db96ec0a1f8c98d4171d578281185840688e53585245ef54ceb7084e88"
  end

  on_intel do
    url "https://github.com/iffse/pay-respects/releases/download/v0.8.4/pay-respects-0.8.4-x86_64-apple-darwin.tar.zst"
    sha256 "faffcad6d2717229ba4ec541c67e7a3a3d68b0f02fe1d1e6910d07fe21c7ba2d"
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
