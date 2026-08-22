cask "koharu" do
  version "0.78.0"
  sha256 "2a291c1c49409d9e2acbaefdcad16f15b665d55fa4c835bfb0b391819647e19a"

  url "https://github.com/mayocream/koharu/releases/download/0.78.0/koharu_0.78.0_aarch64.dmg",
      verified: "github.com/mayocream/koharu/"
  name "Koharu"
  desc "ML-powered manga translator"
  homepage "https://koharu.rs/"

  depends_on arch: :arm64

  app "Koharu.app"
end
