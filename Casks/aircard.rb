cask "aircard" do
  version "1.2.6"
  sha256 "3d622cc4d93b90cd5ce9d1d756f11cf69d8ee78379e300197e5eb1516a5970fd"

  url "https://github.com/Mak5er/AirCard/releases/download/v#{version}/AirCard.dmg"
  name "AirCard"
  desc "Apple Wallet card skinner for iOS 18+"
  homepage "https://github.com/mak5er/AirCard"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "AirCard.app"
end
