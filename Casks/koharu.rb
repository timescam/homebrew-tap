cask "koharu" do
  version "0.79.0"
  sha256 "f13347b4c2a52932e4344295bffdc3c2e5dc4a78dad0c6b6fc6635249530bbe4"

  url "https://github.com/mayocream/koharu/releases/download/0.79.0/koharu_0.79.0_aarch64.dmg",
      verified: "github.com/mayocream/koharu/"
  name "Koharu"
  desc "ML-powered manga translator"
  homepage "https://koharu.rs/"

  depends_on arch: :arm64

  app "Koharu.app"
end
