cask "raycast@beta" do
  version "0.61.0.0"
  sha256 "84d96c5237fcf5332f4a20e4e27bfc2edec75b03d0e7f2352585c452995e645e"

  url "https://x-r2.raycast-releases.com/Raycast_Beta_#{version}_e863712be6_arm64.dmg",
      verified: "raycast-releases.com/"
  name "Raycast Beta"
  desc "Launcher and productivity tool"
  homepage "https://www.raycast.com/"

  auto_updates true
  depends_on arch: :arm64

  app "Raycast Beta.app"
end
