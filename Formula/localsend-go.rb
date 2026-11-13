class LocalsendGo < Formula
  desc "CLI for localsend implemented in Go"
  homepage "https://github.com/meowrain/localsend-go"
  version "1.3.0"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  on_arm do
    url "https://github.com/meowrain/localsend-go/releases/download/v#{version}/localsend-go-darwin-arm64"
    sha256 "47778a8102b4dde647e63ec360bf01203043b2277df2a90658941d4c8a42831c"
  end

  on_intel do
    url "https://github.com/meowrain/localsend-go/releases/download/v#{version}/localsend-go-darwin-amd64"
    sha256 "9318405dfb8a7774cf62b2bf1ad391fff044613a9779e64583b2ca7de4f268a8"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "localsend-go-darwin-arm64" : "localsend-go-darwin-amd64"
    bin.install binary_name => "localsend-go"
  end

  test do
    assert_match "LocalSend CLI", shell_output("#{bin}/localsend-go --help", 2)
  end
end 