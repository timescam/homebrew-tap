cask "koharu" do
  version "0.65.3"
  sha256 "97225e20ac12c707ee20bce9c3aa0ff80eab68b6a1a83855b25eb50511d92113"

  url "https://github.com/mayocream/koharu/releases/download/#{version}/Koharu_#{version}_aarch64.dmg",
      verified: "github.com/mayocream/koharu/"
  name "Koharu"
  desc "ML-powered manga translator"
  homepage "https://koharu.rs/"

  depends_on arch: :arm64

  app "Koharu.app"
end
