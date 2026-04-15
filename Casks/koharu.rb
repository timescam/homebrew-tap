cask "koharu" do
  version "0.44.2"
  sha256 "0e88daac0ff0a75a310db056fadc15076f6e8fe64857337ace83d3ecbfc50676"

  url "https://github.com/mayocream/koharu/releases/download/#{version}/koharu_#{version}_aarch64.dmg",
      verified: "github.com/mayocream/koharu/"
  name "Koharu"
  desc "ML-powered manga translator"
  homepage "https://koharu.rs/"

  depends_on arch: :arm64

  app "koharu.app"
end
