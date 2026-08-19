cask "koharu" do
  version "0.77.3"
  sha256 "a61e83804114d54dd92d9d8062ffde0bb598b2f547305d9e19b7a50dc2b5ab32"

  url "https://github.com/mayocream/koharu/releases/download/0.77.3/koharu_0.77.3_aarch64.dmg",
      verified: "github.com/mayocream/koharu/"
  name "Koharu"
  desc "ML-powered manga translator"
  homepage "https://koharu.rs/"

  depends_on arch: :arm64

  app "Koharu.app"
end
