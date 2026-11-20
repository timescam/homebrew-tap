cask "craft-anything" do
  version "0.6.1"
  sha256 "bbb777d221a4ffe693323c1b6e625f02e71bfa04d74d32a5d50c4542655ed664"

  url "https://github.com/storytold/craft-anything/releases/download/v#{version}/craft-anything-#{version}-macos-universal.dmg"
  name "Craft Anything"
  desc "Study websites, apps and games, then rebuild them with AI"
  homepage "https://getartcraft.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "Craft Anything.app"
end
