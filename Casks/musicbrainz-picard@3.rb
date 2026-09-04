cask "musicbrainz-picard@3" do
  version "3.0.0rc1"

  on_arm do
    sha256 "d6241507fa977fa9b6c55d2d8f4259b4d1bdc8c05791ad8c3e330f8b55a4c67d"

    url "https://github.com/metabrainz/picard/releases/download/release-#{version}/MusicBrainz-Picard-#{version}-macOS-13.0-arm64.dmg"
  end
  on_intel do
    sha256 "5b6af304c8b090c95c1ff25b8e7df333e2d494091146c4a7ce89cd7c50cb6fdb"

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
