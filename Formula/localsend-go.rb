class LocalsendGo < Formula
  desc "CLI for localsend implemented in Go"
  homepage "https://github.com/meowrain/localsend-go"
  version "null"

  on_arm do
    url "https://github.com/meowrain/localsend-go/releases/download/v#{version}/localsend_cli-darwin-arm64"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  end

  on_intel do
    url "https://github.com/meowrain/localsend-go/releases/download/v#{version}/localsend_cli-darwin-amd64"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "localsend_cli-darwin-arm64" : "localsend_cli-darwin-amd64"
    bin.install binary_name => "localsend-go"
  end

  test do
    assert_match "LocalSend CLI", shell_output("#{bin}/localsend-go --help", 2)
  end
end 