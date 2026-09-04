cask "musicbrainz-picard@3" do
  version "3.0.0b9"

  on_arm do
    sha256 "d95899bba9f79a17e955bfbf0776b162f546152ed877e06ef31fa05a0ca02738"

    url "https://github.com/metabrainz/picard/releases/download/release-#{version}/MusicBrainz-Picard-#{version}-macOS-13.0-arm64.dmg"
  end
  on_intel do
    sha256 "1ac5ffb09ad6293111a40dd9e70366d119d7cb44a862ac1ff4e91a89e5b22348"

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

  depends_on macos: :ventura

  conflicts_with cask: ["musicbrainz-picard"]

  app "MusicBrainz Picard.app"

  zap trash: [
    "~/.config/MusicBrainz",
    "~/Library/Caches/MusicBrainz",
    "~/Library/Preferences/org.musicbrainz.picard.plist",
    "~/Library/Saved Application State/org.musicbrainz.picard.savedState",
  ]

end
