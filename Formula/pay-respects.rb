class PayRespects < Formula
  desc "CLI tool to pay respects"
  homepage "https://github.com/iffse/pay-respects"
  version "0.7.8"

  on_arm do
    url "https://github.com/iffse/pay-respects/releases/download/v0.7.8/pay-respects-0.7.8-aarch64-apple-darwin.tar.zst"
    sha256 "3d17d08b9a3a1f045952ea9d6034c8519786775db2a8c3b948a5657878aab239"
  end

  on_intel do
    url "https://github.com/iffse/pay-respects/releases/download/v0.7.8/pay-respects-0.7.8-x86_64-apple-darwin.tar.zst"
    sha256 "179dcf08610de9e4d18bad6dc930886b6fe01371108c25a02a273ce6f11aa312"
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
