cask "koharu" do
  version "0.77.5"
  sha256 "cce8242ea73af4df53f4a56b22caf01d4e620f4bbc626bd85629886e02506d7f"

  url "https://github.com/mayocream/koharu/releases/download/0.77.5/koharu_0.77.5_aarch64.dmg",
      verified: "github.com/mayocream/koharu/"
  name "Koharu"
  desc "ML-powered manga translator"
  homepage "https://koharu.rs/"

  depends_on arch: :arm64

  app "Koharu.app"
end
