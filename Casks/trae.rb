cask "trae" do
  version "1.0.5431"

  arch arm: "-arm64",
       intel: "-x64"

  sha256 arm:   "795fa8e59917455d11e416c533694485677043bb6e2b4e0c4df3d4e50b13973b",
         intel: "3a7cd6b6877ac0e46cd8d89cbd151b9d255acc9affba42f94af894a3e56b1012"

  url "https://lf-cdn.trae.ai/obj/trae-ai-sg/pkg/app/releases/stable/#{version}/darwin/Trae-darwin#{arch}.dmg",
      verified: "lf-cdn.trae.ai"

  name "Trae"
  desc "An adaptive AI IDE that transforms how you work, collaborating with you to run faster."
  homepage "https://www.trae.ai/"

  auto_updates true

  app "Trae.app"

  zap trash: [
    "~/Library/Application Support/Trae",
    "~/Library/Preferences/com.trae.app.plist",
    "~/Library/Saved Application State//Users/rexky/Library/Saved Application State/com.trae.app.savedState",
    "~/Library/Logs/Trae"
  ]
end