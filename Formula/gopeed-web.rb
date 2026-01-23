class GopeedWeb < Formula
  desc "A modern download manager that supports all platforms. Built with Golang and Flutter."
  homepage "https://github.com/GopeedLab/gopeed"
  version "1.9.0"
  
  on_arm do
    url "https://github.com/GopeedLab/gopeed/releases/download/v1.9.0/gopeed-web-v1.9.0-macos-arm64.zip"
    sha256 "2d6940b3ad2a25f7e8bcdf274794cc2ba1b3576e5d0494dc7479cb891f5ec65b"
  end
  
  on_intel do
    url "https://github.com/GopeedLab/gopeed/releases/download/v1.9.0/gopeed-web-v1.9.0-macos-amd64.zip"
    sha256 "b47c7611df92f84b5292cdb11fafe3acef299a007412319686b49a56c891e870"
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