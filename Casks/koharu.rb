cask "koharu" do
  version "0.78.1"
  sha256 "e81a81643dd48e19642a2882a0f6da57efe337aaf69daeffaed4483a855fd32f"

  url "https://github.com/mayocream/koharu/releases/download/0.78.1/koharu_0.78.1_aarch64.dmg",
      verified: "github.com/mayocream/koharu/"
  name "Koharu"
  desc "ML-powered manga translator"
  homepage "https://koharu.rs/"

  depends_on arch: :arm64

  app "Koharu.app"
end
