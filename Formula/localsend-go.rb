class LocalsendGo < Formula
  desc "CLI for localsend implemented in Go"
  homepage "https://github.com/meowrain/localsend-go"
  version "1.2.3"

  on_arm do
    url "https://github.com/meowrain/localsend-go/releases/download/v#{version}/localsend_cli-darwin-arm64"
    sha256 "8c4b0e821beca23db50b8ab62a0f0be36e4ad5ddd0abb440eaf7f0f3afb53558"
  end

  on_intel do
    url "https://github.com/meowrain/localsend-go/releases/download/v#{version}/localsend_cli-darwin-amd64"
    sha256 "86c60aafbe63558947ca67b33f9b8e677eef5f753822a02fd31a7c3899302b9f"
  end

  def install
    binary_name = Hardware::CPU.arm? ? "localsend_cli-darwin-arm64" : "localsend_cli-darwin-amd64"
    bin.install binary_name => "localsend-go"
  end

  test do
    assert_match "LocalSend CLI", shell_output("#{bin}/localsend-go --help", 2)
  end
end 