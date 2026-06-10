cask "koharu" do
  version "0.61.0"
  sha256 "6a4fa8dcea16e75aaf4511374a0656c8ac3c7db1a49f06ae91d55621f811010a"

  url "https://github.com/mayocream/koharu/releases/download/#{version}/koharu_#{version}_aarch64.dmg",
      verified: "github.com/mayocream/koharu/"
  name "Koharu"
  desc "ML-powered manga translator"
  homepage "https://koharu.rs/"

  depends_on arch: :arm64

  app "koharu.app"
end
