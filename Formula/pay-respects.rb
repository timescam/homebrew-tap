class PayRespects < Formula
  desc "CLI tool to pay respects"
  homepage "https://github.com/iffse/pay-respects"
  version "nightly"

  on_arm do
    url "https://github.com/iffse/pay-respects/releases/download/nightly/pay-respects-nightly-aarch64-apple-darwin.tar.zst"
    sha256 "325d6214ad09e1f5d79454221ee1f66e73c3eba3fea5a37387afd1e5ed156c3b"
  end

  on_intel do
    url "https://github.com/iffse/pay-respects/releases/download/nightly/pay-respects-nightly-x86_64-apple-darwin.tar.zst"
    sha256 "79af7039da6fb0de4080c57a54dbaff46a1205977e3972b1204645b32cd1cb42"
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
