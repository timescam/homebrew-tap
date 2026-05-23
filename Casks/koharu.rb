cask "koharu" do
  version "0.59.2"
  sha256 "34cef56cd507bad441e0a813b348e490a4094f04bf34e1df485292701bbf732a"

  url "https://github.com/mayocream/koharu/releases/download/#{version}/koharu_#{version}_aarch64.dmg",
      verified: "github.com/mayocream/koharu/"
  name "Koharu"
  desc "ML-powered manga translator"
  homepage "https://koharu.rs/"

  depends_on arch: :arm64

  app "koharu.app"
end
