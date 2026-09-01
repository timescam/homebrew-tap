class GopeedWeb < Formula
  desc "A modern download manager that supports all platforms. Built with Golang and Flutter."
  homepage "https://github.com/GopeedLab/gopeed"
  version "1.9.3"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  on_arm do
    url "https://github.com/GopeedLab/gopeed/releases/download/v#{version}/gopeed-web-v#{version}-macos-arm64.zip"
    sha256 "d0a6923297c31cdcdfd9caab2e1d312b6a91a1cc3bab4d4ec43418093cc7c927"
  end

  on_intel do
    url "https://github.com/GopeedLab/gopeed/releases/download/v#{version}/gopeed-web-v#{version}-macos-amd64.zip"
    sha256 "390c51e2406349e69a31d95bf24024fdf482d3cc4001762e7429a8add182a3c8"
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
