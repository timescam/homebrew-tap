cask "koharu" do
  version "0.63.4"
  sha256 "1c4cc9e54a8c449b72492b1f6a99e6928446de96bcdcb8171e46a06280a59090"

  url "https://github.com/mayocream/koharu/releases/download/#{version}/koharu_#{version}_aarch64.dmg",
      verified: "github.com/mayocream/koharu/"
  name "Koharu"
  desc "ML-powered manga translator"
  homepage "https://koharu.rs/"

  depends_on arch: :arm64

  app "koharu.app"
end
