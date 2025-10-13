class GopeedWeb < Formula
  desc "A modern download manager that supports all platforms. Built with Golang and Flutter."
  homepage "https://github.com/GopeedLab/gopeed"
  version "1.8.2"
  
  on_arm do
    url "https://github.com/GopeedLab/gopeed/releases/download/v1.8.2/gopeed-web-v1.8.2-macos-arm64.zip"
    sha256 "32fb76c260bfbd5782a265b645a2830cd0647e3b172ac83895796a04e362dae6"
  end
  
  on_intel do
    url "https://github.com/GopeedLab/gopeed/releases/download/v1.8.2/gopeed-web-v1.8.2-macos-amd64.zip"
    sha256 "254d0752fd8b134f01c3c5c698f32a63249c110065b2009bce123b8221c3bab0"
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