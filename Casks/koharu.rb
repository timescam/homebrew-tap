cask "koharu" do
  version "0.80.0"
  sha256 "dc5381d5d4b1dfe635efa7ae4953a64748d54dc2af8d3e200eef691d021d9d72"

  url "https://github.com/koharu-rs/koharu/releases/download/0.80.0/koharu_0.80.0_aarch64.dmg",
      verified: "github.com/mayocream/koharu/"
  name "Koharu"
  desc "ML-powered manga translator"
  homepage "https://koharu.rs/"

  depends_on arch: :arm64

  app "Koharu.app"
end
