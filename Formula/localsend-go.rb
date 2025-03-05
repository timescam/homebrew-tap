class LocalsendGo < Formula
  desc "CLI for localsend implemented in Go"
  homepage "https://github.com/meowrain/localsend-go"
  version "1.2.4"

  on_arm do
    url "https://github.com/meowrain/localsend-go/releases/download/v#{version}/localsend_cli-darwin-arm64"
    sha256 "afb88e3bb4e10c657fb9cee12f5430d9925cd08a8533144a35ce5da5fde4ecca"
  end

  on_intel do
    url "https://github.com/meowrain/localsend-go/releases/download/v#{version}/localsend_cli-darwin-amd64"
    sha256 "e552a3d6ec1f271fef64219b58dbe0c06558b84769b07605864130d3aed587f3"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "localsend_cli-darwin-arm64" : "localsend_cli-darwin-amd64"
    bin.install binary_name => "localsend-go"
  end

  test do
    assert_match "LocalSend CLI", shell_output("#{bin}/localsend-go --help", 2)
  end
end 