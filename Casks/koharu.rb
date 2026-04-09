cask "koharu" do
  version "0.43.2"
  sha256 "64213cb0fbbca5288d0d8b5f1f1cb01332fe2cdb1c773f5d6d650902c4ab10f7"

  url "https://github.com/mayocream/koharu/releases/download/#{version}/koharu_#{version}_aarch64.dmg",
      verified: "github.com/mayocream/koharu/"
  name "Koharu"
  desc "ML-powered manga translator"
  homepage "https://koharu.rs/"

  depends_on arch: :arm64

  app "koharu.app"
end
