class LocalsendGo < Formula
  desc "CLI for localsend implemented in Go"
  homepage "https://github.com/meowrain/localsend-go"
  version "1.2.7"

  on_arm do
    url "https://github.com/meowrain/localsend-go/releases/download/v1.2.7/localsend-go-darwin-arm64"
    sha256 "2ee70ddde3e93a0401f36290a7294f6988595df2bb69edbd59d25ef6d2b623b9"
  end

  on_intel do
    url "https://github.com/meowrain/localsend-go/releases/download/v1.2.7/localsend-go-darwin-amd64"
    sha256 "0f796161068a558f74d71a599e76d8e98f6f95ca83a327fffb2ea0a5a0d2844a"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "localsend-go-darwin-arm64" : "localsend-go-darwin-amd64"
    bin.install binary_name => "localsend-go"
  end

  test do
    assert_match "LocalSend CLI", shell_output("#{bin}/localsend-go --help", 2)
  end
end 