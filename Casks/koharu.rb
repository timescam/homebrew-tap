cask "koharu" do
  version "0.64.2"
  sha256 "839488ebc08446a096a893996ed23eac321ac166724cd8c5d9092057834d2d79"

  url "https://github.com/mayocream/koharu/releases/download/#{version}/koharu_#{version}_aarch64.dmg",
      verified: "github.com/mayocream/koharu/"
  name "Koharu"
  desc "ML-powered manga translator"
  homepage "https://koharu.rs/"

  depends_on arch: :arm64

  app "koharu.app"
end
