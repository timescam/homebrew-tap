class GopeedWeb < Formula
  desc "A modern download manager that supports all platforms. Built with Golang and Flutter."
  homepage "https://github.com/GopeedLab/gopeed"
  version "1.8.0"
  
  on_arm do
    url "https://github.com/GopeedLab/gopeed/releases/download/v1.8.0/gopeed-web-v1.8.0-macos-arm64.zip"
    sha256 "fab217a326cbfac9639150d8c7ab3e8f88326f5fd838630f716ee7ab7944393f"
  end
  
  on_intel do
    url "https://github.com/GopeedLab/gopeed/releases/download/v1.8.0/gopeed-web-v1.8.0-macos-amd64.zip"
    sha256 "32f0461a3418443db3832910cf0370230a315b398a866574bbef68413f1305c0"
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