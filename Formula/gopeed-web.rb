class GopeedWeb < Formula
  desc "A modern download manager that supports all platforms. Built with Golang and Flutter."
  homepage "https://github.com/GopeedLab/gopeed"
  version "1.8.1"
  
  on_arm do
    url "https://github.com/GopeedLab/gopeed/releases/download/v1.8.1/gopeed-web-v1.8.1-macos-arm64.zip"
    sha256 "c79269a85dccc8363e257dcade0a4c8830dfc966c858bc7cc2026b14b1caa2f2"
  end
  
  on_intel do
    url "https://github.com/GopeedLab/gopeed/releases/download/v1.8.1/gopeed-web-v1.8.1-macos-amd64.zip"
    sha256 "a7d403c31563a125f54bc5e6f4d8e2de6b1cea82ce506ad624cf96df19df1a41"
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