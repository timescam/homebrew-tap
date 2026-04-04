class PayRespects < Formula
  desc "CLI tool to pay respects"
  homepage "https://github.com/iffse/pay-respects"
  version "0.8.2"

  on_arm do
    url "https://github.com/iffse/pay-respects/releases/download/v0.8.2/pay-respects-0.8.2-aarch64-apple-darwin.tar.zst"
    sha256 "fb1e67d2b977f426a44e79ed66abbdba0aceac320a134602b814b9da5a1eee95"
  end

  on_intel do
    url "https://github.com/iffse/pay-respects/releases/download/v0.8.2/pay-respects-0.8.2-x86_64-apple-darwin.tar.zst"
    sha256 "c44dc7131c95d33323a746efe6a61a780576a176f271fbabf76c1e6f5c59c76c"
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
