cask "koharu" do
  version "0.61.1"
  sha256 "a4a4c1cdb48ce1c9b49cd24246331e86d490d07006b9d5c5d4efbc32c869ad31"

  url "https://github.com/mayocream/koharu/releases/download/#{version}/koharu_#{version}_aarch64.dmg",
      verified: "github.com/mayocream/koharu/"
  name "Koharu"
  desc "ML-powered manga translator"
  homepage "https://koharu.rs/"

  depends_on arch: :arm64

  app "koharu.app"
end
