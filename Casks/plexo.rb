cask "plexo" do
  arch arm: "arm64", intel: "x64"

  version "1.0.0-rc.15"
  sha256 arm:   "3e05a6ada7e50bf401472c0dbf14a48a709404d36a4b8bf8572ea88a3e57e64d",
         intel: "1e02f606efbf0ba1b81bc55d0e48599bec39ba44a5734d9c17d07db46b0453ed"

  url "https://github.com/anmolkapil/plexo/releases/download/v#{version}/plexo-#{version}-#{arch}.dmg"
  name "Plexo"
  desc "Download manager that uses multiple connections in parallel"
  homepage "https://github.com/anmolkapil/plexo"

  livecheck do
    url :url
    regex(%r{\A v? (\d+(?:\.\d+)+ (?: -rc\.\d+ )? ) \z}ix)
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "Plexo.app"

  zap trash: [
    "~/Library/Application Support/Plexo",
    "~/Library/Caches/com.plexo.app",
    "~/Library/Caches/com.plexo.app.ShipIt",
    "~/Library/Logs/Plexo",
    "~/Library/Preferences/com.plexo.app.plist",
    "~/Library/Saved Application State/com.plexo.app.savedState",
  ]
end
