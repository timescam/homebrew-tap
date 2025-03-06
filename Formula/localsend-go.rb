class LocalsendGo < Formula
  desc "CLI for localsend implemented in Go"
  homepage "https://github.com/meowrain/localsend-go"
  version "1.2.5"

  on_arm do
    url "https://github.com/meowrain/localsend-go/releases/download/v#{version}/localsend_cli-darwin-arm64"
    sha256 "b30cca0c78660c1cb6f87dfb0e913803b1f77b157b1bba1fa8a83000cae1ca41"
  end

  on_intel do
    url "https://github.com/meowrain/localsend-go/releases/download/v#{version}/localsend_cli-darwin-amd64"
    sha256 "28f2b34d832fd55d71fabde19604b7c2c437db7181c8642fd40373b6b8b9a7b5"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "localsend_cli-darwin-arm64" : "localsend_cli-darwin-amd64"
    bin.install binary_name => "localsend-go"
  end

  test do
    assert_match "LocalSend CLI", shell_output("#{bin}/localsend-go --help", 2)
  end
end 