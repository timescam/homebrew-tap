cask "aircard" do
  version "1.2.4"
  sha256 "005b5c7bc97ef8654ae34ad234dadd53c0503c9f9a76721dc26634c35f61d6ce"

  url "https://github.com/Mak5er/AirCard/releases/download/v#{version}/AirCard.dmg"
  name "AirCard"
  desc "Apple Wallet card skinner for iOS 18+"
  homepage "https://github.com/mak5er/AirCard"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :monterey

  app "AirCard.app"
end
