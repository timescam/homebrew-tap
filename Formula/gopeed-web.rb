class GopeedWeb < Formula
  desc "A modern download manager that supports all platforms. Built with Golang and Flutter."
  homepage "https://github.com/GopeedLab/gopeed"
  version "1.8.0"
  
  on_arm do
    url "https://github.com/GopeedLab/gopeed/releases/download/v1.8.0/gopeed-web-v1.8.0-macos-arm64.zip"
    sha256 "e3c5bb23a572cef45bfcffa7ce33a923cf2524a8d9b137ddac2842a7d599120b"
  end
  
  on_intel do
    url "https://github.com/GopeedLab/gopeed/releases/download/v1.8.0/gopeed-web-v1.8.0-macos-amd64.zip"
    sha256 "d44a3d8f75f7a156b61fda30ac4f68c75e700a30e3902a00078c05c27d7684ba"
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