class Spotatui < Formula
  desc "Spotify client for the terminal (Rust TUI, native streaming)"
  homepage "https://github.com/LargeModGames/spotatui"
  version "0.42.0"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  on_arm do
    url "https://github.com/LargeModGames/spotatui/releases/download/v#{version}/spotatui-macos-aarch64.tar.gz"
    sha256 "f08e7105c119b4238f025002051880d5289d92e32349e45f394f34a1762fdf62"
  end

  on_intel do
    url "https://github.com/LargeModGames/spotatui/releases/download/v#{version}/spotatui-macos-x86_64.tar.gz"
    sha256 "7600080d7b30135a512880cf76b89018d86a351ed00acc9ff1a2ec6eb71cf636"
  end

  def install
    bin.install "spotatui"
  end

  test do
    system "#{bin}/spotatui", "--version"
  end
end
