cask "koharu" do
  version "0.75.11"
  sha256 "ed3c5e62ed089edd08828b9b3ded621ddaf72f908d413b4808d7862a7d654e6e"

  url "https://github.com/mayocream/koharu/releases/download/0.75.11/koharu_0.75.11_aarch64.dmg",
      verified: "github.com/mayocream/koharu/"
  name "Koharu"
  desc "ML-powered manga translator"
  homepage "https://koharu.rs/"

  depends_on arch: :arm64

  app "Koharu.app"
end
