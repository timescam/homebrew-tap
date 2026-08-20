cask "koharu" do
  version "0.77.4"
  sha256 "b36477c0bbe4cfbb95c9550dd8772b864304a9ea6a3e295c56f9b5506b877ff3"

  url "https://github.com/mayocream/koharu/releases/download/0.77.4/koharu_0.77.4_aarch64.dmg",
      verified: "github.com/mayocream/koharu/"
  name "Koharu"
  desc "ML-powered manga translator"
  homepage "https://koharu.rs/"

  depends_on arch: :arm64

  app "Koharu.app"
end
