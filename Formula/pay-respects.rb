class PayRespects < Formula
  desc "CLI tool to pay respects"
  homepage "https://github.com/iffse/pay-respects"
  version "0.7.3"

  on_arm do
    url "https://github.com/iffse/pay-respects/releases/download/v0.7.3/pay-respects-0.7.3-aarch64-apple-darwin.tar.zst"
    sha256 "efadb82414c29e58af9d846eed295ccaec3365582ae37f8e2a6fbb937ae1d549"
  end

  on_intel do
    url "https://github.com/iffse/pay-respects/releases/download/v0.7.3/pay-respects-0.7.3-x86_64-apple-darwin.tar.zst"
    sha256 "59af7cd4d9208ee21bb4e79ae4a3a23ed86e729fd54268d1255699157ee8712b"
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
