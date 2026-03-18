class GopeedWeb < Formula
  desc "A modern download manager that supports all platforms. Built with Golang and Flutter."
  homepage "https://github.com/GopeedLab/gopeed"
  version "1.9.3"
  
  on_arm do
    url "https://github.com/GopeedLab/gopeed/releases/download/v1.9.3/gopeed-web-v1.9.3-macos-arm64.zip"
    sha256 "d0a6923297c31cdcdfd9caab2e1d312b6a91a1cc3bab4d4ec43418093cc7c927"
  end
  
  on_intel do
    url "https://github.com/GopeedLab/gopeed/releases/download/v1.9.3/gopeed-web-v1.9.3-macos-amd64.zip"
    sha256 "390c51e2406349e69a31d95bf24024fdf482d3cc4001762e7429a8add182a3c8"
  end
  
  def install
    # Install as gopeed-web
    bin.install "gopeed" => "gopeed-web"
    
    # Create example config
    (buildpath/"gopeed.json").write <<~EOS
      {
        "address": "0.0.0.0",
        "storageDir": "~/Downloads"
      }
    EOS
    (var/"gopeed-web").mkpath
    (var/"gopeed-web").install "gopeed.json"
  end
  
  def caveats
    <<~EOS
      Copy example config: cp #{var}/gopeed-web/gopeed.json ~/.config/gopeed.json
      By default, the web interface will be available at: http://localhost:9999
    EOS
  end

  service do
    run [bin/"gopeed-web", "-c", "~/.config/gopeed.json"]
    keep_alive true
    launch_only_once true
    working_dir var/"gopeed-web"
    process_type :background
  end

  def uninstall_postflight
    (var/"gopeed-web").rmtree if (var/"gopeed-web").exist?
  end

  test do
    system "#{bin}/gopeed-web", "-h"
  end
end