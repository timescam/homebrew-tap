cask "koharu" do
  version "0.80.0"
  sha256 "dc5381d5d4b1dfe635efa7ae4953a64748d54dc2af8d3e200eef691d021d9d72"

  url "https://github.com/koharu-rs/koharu/releases/download/#{version}/koharu_#{version}_aarch64.dmg"
  name "Koharu"
  desc "ML-powered manga translator"
  homepage "https://koharu.rs/"

  deprecate! date: "2026-09-04", because: "moved to homebrew/cask", replacement_cask: "koharu"

  depends_on arch: :arm64

  app "Koharu.app"
end
