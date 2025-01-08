cask "theboringnotch" do
  version "glowing-panda"
  sha256 "d893583bfc7e9d14c9bc14d82bca61aad5a77770ec28cccee1b276c97733115a"

  url "https://github.com/TheBoredTeam/boring.notch/releases/download/#{version}/#{version.split('-').map(&:capitalize).join}.dmg"
  name "TheBoringNotch"
  desc "Not so boring notch That Rocks 🎸🎶"
  homepage "https://github.com/TheBoredTeam/boring.notch"

  app "boringNotch.app"
end 
