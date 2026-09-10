cask "atoll" do
  version "2.3.3"
  sha256 ""

  url "https://github.com/Ebullioscopic/Atoll/releases/download/v#{version}/Atoll.#{version}.dmg"
  name "Atoll"
  desc "Dynamic Island utility"
  homepage "https://getatoll.app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Atoll.app"
end
