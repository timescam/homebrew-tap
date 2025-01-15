cask "theboringnotch" do
  version "jellyfin.snoring"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"

  url "https://github.com/TheBoredTeam/boring.notch/releases/download/#{version}/#{version.split('-').map(&:capitalize).join}.dmg"
  name "TheBoringNotch"
  desc "Not so boring notch That Rocks 🎸🎶"
  homepage "https://github.com/TheBoredTeam/boring.notch"

  app "boringNotch.app"
end 
