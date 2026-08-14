cask "koharu" do
  version "0.66.10"
  sha256 "2e56fd263d213b1406055e321cc41bc996a93eea6cabacc54eadacd43782dc97"

  url "https://github.com/mayocream/koharu/releases/download/0.66.10/koharu_0.66.10_aarch64.dmg",
      verified: "github.com/mayocream/koharu/"
  name "Koharu"
  desc "ML-powered manga translator"
  homepage "https://koharu.rs/"

  depends_on arch: :arm64

  app "Koharu.app"
end
