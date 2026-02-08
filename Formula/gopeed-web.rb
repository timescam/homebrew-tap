class GopeedWeb < Formula
  desc "A modern download manager that supports all platforms. Built with Golang and Flutter."
  homepage "https://github.com/GopeedLab/gopeed"
  version "1.9.1"
  
  on_arm do
    url "https://github.com/GopeedLab/gopeed/releases/download/v1.9.1/gopeed-web-v1.9.1-macos-arm64.zip"
    sha256 "b637eae51e508cf50c9065153a1f69a5a09f1a8c462635a2e4f71fc916cd5b3e"
  end
  
  on_intel do
    url "https://github.com/GopeedLab/gopeed/releases/download/v1.9.1/gopeed-web-v1.9.1-macos-amd64.zip"
    sha256 "70ab8ca8ff0b6847fe6114eb604b5864fc6e5a67c1483ececab74e2032360cf4"
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