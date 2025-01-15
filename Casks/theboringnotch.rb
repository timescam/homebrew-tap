cask "theboringnotch" do
  version "jellyfin.snoring"
  sha256 "97780877acdbecc6701fc5970478c708f36417b3c28c2fda3db07732645fdce0"

  url "https://github.com/TheBoredTeam/boring.notch/releases/download/#{version}/#{version.split('.').map(&:capitalize).join}.dmg"
  name "TheBoringNotch"
  desc "Not so boring notch That Rocks 🎸🎶"
  homepage "https://github.com/TheBoredTeam/boring.notch"

  app "boringNotch.app"
end 
