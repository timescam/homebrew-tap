cask "aircard" do
  version "1.2.5"
  sha256 "ec8f34f25919a939aca44a928ff96d6b88a0a3774d5d4e8cfda7481dd8cb3e54"

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
