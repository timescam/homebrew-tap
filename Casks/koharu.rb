cask "koharu" do
  version "0.50.0"
  sha256 "0ea55662357d9baf82c8b1e73142fef4ab22480b134198db51641009c2c9d116"

  url "https://github.com/mayocream/koharu/releases/download/#{version}/koharu_#{version}_aarch64.dmg",
      verified: "github.com/mayocream/koharu/"
  name "Koharu"
  desc "ML-powered manga translator"
  homepage "https://koharu.rs/"

  depends_on arch: :arm64

  app "koharu.app"
end
