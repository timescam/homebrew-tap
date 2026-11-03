class PayRespects < Formula
  desc "CLI tool to pay respects"
  homepage "https://github.com/iffse/pay-respects"
  version "0.9.0"

  livecheck do
    url :homepage
    strategy :github_releases
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_arm do
    url "https://github.com/iffse/pay-respects/releases/download/v#{version}/pay-respects-#{version}-aarch64-apple-darwin.tar.zst"
    sha256 "ba11712db3dac2d4548abf4747186751636962271fdcda44d078463dde47e158"
  end

  on_intel do
    url "https://github.com/iffse/pay-respects/releases/download/v#{version}/pay-respects-#{version}-x86_64-apple-darwin.tar.zst"
    sha256 "0754726c1b504cfd471eaf3d0aad8ba763201902f0394ad774f65633712f95ac"
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
