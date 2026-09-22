cask "musicbrainz-picard@3" do
  version "3.0.0rc4"

  on_arm do
    sha256 "6d2fa56797b67621372ec1307a15b98a7487b48ea34528867422337363c92ef0"

    url "https://github.com/metabrainz/picard/releases/download/release-#{version}/MusicBrainz-Picard-#{version}-macOS-13.0-arm64.dmg"
  end
  on_intel do
    sha256 "57afbb8a542229fec51454350cac73fcf1a9f6af0e823faeb86bb3102f4dafb2"

    url "https://github.com/metabrainz/picard/releases/download/release-#{version}/MusicBrainz-Picard-#{version}-macOS-13.0-x86_64.dmg"
  end

  name "MusicBrainz Picard"
  desc "Music tagger"
  homepage "https://picard.musicbrainz.org/"

  livecheck do
    url :url
    regex(/^release-([3-9]\.\d+(?:\.\d+)*(?:[a-z]+\d+)?)$/i)
    strategy :github_releases do |json, regex|
      json.map do |release|
        next if release["draft"]

        match = release["tag_name"]&.match(regex)
        next if match.blank?

        match[1]
      end
    end
  end

  conflicts_with cask: "musicbrainz-picard"
  depends_on macos: :ventura

  app "MusicBrainz Picard.app"

  zap trash: [
    "~/.config/MusicBrainz",
    "~/Library/Caches/MusicBrainz",
    "~/Library/Preferences/org.musicbrainz.picard.plist",
    "~/Library/Saved Application State/org.musicbrainz.picard.savedState",
  ]
end
