cask "koharu" do
  version "0.70.2"
  sha256 "8cde1d807bf88623edc691bb46449fdeaaa66825ea85f561e78d86b74bdd9e6d"

  url "https://github.com/mayocream/koharu/releases/download/0.70.2/koharu_0.70.2_aarch64.dmg",
      verified: "github.com/mayocream/koharu/"
  name "Koharu"
  desc "ML-powered manga translator"
  homepage "https://koharu.rs/"

  depends_on arch: :arm64

  app "Koharu.app"
end
