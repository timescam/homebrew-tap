cask "koharu" do
  version "0.53.0"
  sha256 "0424f1bf521f627a960eb2d36259560680d8aec5a2488793dd5bf48396142c16"

  url "https://github.com/mayocream/koharu/releases/download/#{version}/koharu_#{version}_aarch64.dmg",
      verified: "github.com/mayocream/koharu/"
  name "Koharu"
  desc "ML-powered manga translator"
  homepage "https://koharu.rs/"

  depends_on arch: :arm64

  app "koharu.app"
end
