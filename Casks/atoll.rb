cask "atoll" do
  version "2.1.0"
  sha256 ""

  url "https://github.com/Ebullioscopic/Atoll/releases/download/v#{version}/Atoll.#{version}.dmg",
      verified: "github.com/Ebullioscopic/Atoll/"
  name "Atoll"
  desc "Dynamic Island utility"
  homepage "https://getatoll.app/"

  depends_on macos: ">= :sonoma"

  app "Atoll.app"
end
