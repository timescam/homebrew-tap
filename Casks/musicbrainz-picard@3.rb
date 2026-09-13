cask "musicbrainz-picard@3" do
  version "3.0.0rc3"

  on_arm do
    sha256 "b4b703a63bf5b51ca9f371fb3b7531353dc4820623357726a7a1f64d5ab3634a"

    url "https://github.com/metabrainz/picard/releases/download/release-#{version}/MusicBrainz-Picard-#{version}-macOS-13.0-arm64.dmg"
  end
  on_intel do
    sha256 "004e49b0598801c6035575cd838b4c6bb47f824188dec2644eb5fb3b996a20cf"

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
