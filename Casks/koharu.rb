cask "koharu" do
  version "0.73.0"
  sha256 "29532fc95272e572162978503377780e1d8c4c97046b3444e53d6b70ac5df253"

  url "https://github.com/mayocream/koharu/releases/download/0.73.0/koharu_0.73.0_aarch64.dmg",
      verified: "github.com/mayocream/koharu/"
  name "Koharu"
  desc "ML-powered manga translator"
  homepage "https://koharu.rs/"

  depends_on arch: :arm64

  app "Koharu.app"
end
