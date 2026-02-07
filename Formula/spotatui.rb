class Spotatui < Formula
  desc "Spotify client for the terminal (Rust TUI, native streaming)"
  homepage "https://github.com/LargeModGames/spotatui"
  version "0.35.6"

  on_arm do
    url "https://github.com/LargeModGames/spotatui/releases/download/v#{version}/spotatui-macos-aarch64.tar.gz"
    sha256 "1c43a5c985502b7bdd3f66404f07f6a7ab39456ce7e058131c0141721550433d"
  end

  on_intel do
    url "https://github.com/LargeModGames/spotatui/releases/download/v#{version}/spotatui-macos-x86_64.tar.gz"
    sha256 "fbab56d2b9c9dcded364033bdebf3c27d9f1f268797d728e3368bdfbac284796"
  end

  def install
    bin.install "spotatui"
  end

  test do
    system "#{bin}/spotatui", "--version"
  end
end
