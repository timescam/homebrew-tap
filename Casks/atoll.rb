cask "atoll" do
  version "2.3.2"
  sha256 ""

  url "https://github.com/Ebullioscopic/Atoll/releases/download/v#{version}/Atoll.#{version}.dmg",
      verified: "github.com/Ebullioscopic/Atoll/"
  name "Atoll"
  desc "Dynamic Island utility"
  homepage "https://getatoll.app/"

  app "Atoll.app"
end
