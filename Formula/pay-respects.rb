class PayRespects < Formula
  desc "CLI tool to pay respects"
  homepage "https://github.com/iffse/pay-respects"
  version "nightly"

  on_arm do
    url "https://github.com/iffse/pay-respects/releases/download/nightly/pay-respects-nightly-aarch64-apple-darwin.tar.zst"
    sha256 "c9baaa4765f26170a53aad556d814a8a9dea28fbbd3a89d1e823e193cf6cd990"
  end

  on_intel do
    url "https://github.com/iffse/pay-respects/releases/download/nightly/pay-respects-nightly-x86_64-apple-darwin.tar.zst"
    sha256 "5230e2287f436e6a0a72086820f454c1b4462ce931c5a5b258c65c8c2e3c4624"
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
