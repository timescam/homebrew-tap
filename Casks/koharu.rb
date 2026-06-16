cask "koharu" do
  version "0.61.2"
  sha256 "915da65d5d093061757994c25ebf429b421fe6518ec666e7531f35bf63729c14"

  url "https://github.com/mayocream/koharu/releases/download/#{version}/koharu_#{version}_aarch64.dmg",
      verified: "github.com/mayocream/koharu/"
  name "Koharu"
  desc "ML-powered manga translator"
  homepage "https://koharu.rs/"

  depends_on arch: :arm64

  app "koharu.app"
end
