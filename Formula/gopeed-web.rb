class GopeedWeb < Formula
  desc "A modern download manager that supports all platforms. Built with Golang and Flutter."
  homepage "https://github.com/GopeedLab/gopeed"
  version "2.0.0"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  on_arm do
    url "https://github.com/GopeedLab/gopeed/releases/download/v#{version}/gopeed-web-v#{version}-macos-arm64.zip"
    sha256 "9cd6c74a62ab3c250b1f89807cc612ecfe8f1ad655084107e8db38af8aa66b6b"
  end

  on_intel do
    url "https://github.com/GopeedLab/gopeed/releases/download/v#{version}/gopeed-web-v#{version}-macos-amd64.zip"
    sha256 "3b75dd384d425bc4e9c20669b4ec9c52e4cb1f1665162d46abd1715444608ece"
  end

  def install
    bin.install "gopeed" => "gopeed-web"
    (var/"gopeed-web").mkpath
  end

  def caveats
    <<~EOS
      Example config (~/.config/gopeed.json):
        {
          "address": "0.0.0.0",
          "storageDir": "~/Downloads"
        }
      Web UI: http://localhost:9999
    EOS
  end

  service do
    run [bin/"gopeed-web", "-c", "~/.config/gopeed.json"]
    keep_alive true
    launch_only_once true
    working_dir var/"gopeed-web"
    process_type :background
  end

  test do
    system "#{bin}/gopeed-web", "-h"
  end
end
