class LocalsendGo < Formula
  desc "CLI for localsend implemented in Go"
  homepage "https://github.com/meowrain/localsend-go"
  version "1.2.0"

  on_arm do
    url "https://github.com/meowrain/localsend-go/releases/download/v#{version}/localsend_cli-darwin-arm64"
    sha256 "19d48ec815248be5a410926a08c4f810a46b7602b3235709d102fb546adf39a9"
  end

  on_intel do
    url "https://github.com/meowrain/localsend-go/releases/download/v#{version}/localsend_cli-darwin-amd64"
    sha256 "bd0e43641b93ecf744a352e9ee1ad0736d8c10cd06f972ddb7ae98237122ba93"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "localsend_cli-darwin-arm64" : "localsend_cli-darwin-amd64"
    bin.install binary_name => "localsend-go"
  end

  test do
    assert_match "LocalSend CLI", shell_output("#{bin}/localsend-go --help", 2)
  end
end 