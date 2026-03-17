cask "atoll" do
  version "2.0.1"
  sha256 "5daa903ffecc0b90436248161ed4fe269647c9832ffe04dffc345fe80e5d0ab8"

  url "https://github.com/Ebullioscopic/Atoll/releases/download/v#{version}/Atoll.#{version}.dmg",
      verified: "github.com/Ebullioscopic/Atoll/"
  name "Atoll"
  desc "Dynamic Island utility"
  homepage "https://getatoll.app/"

  depends_on macos: ">= :sonoma"

  app "Atoll.app"
end
