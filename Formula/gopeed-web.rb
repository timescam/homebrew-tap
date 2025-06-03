class GopeedWeb < Formula
  desc "A modern download manager that supports all platforms. Built with Golang and Flutter."
  homepage "https://github.com/GopeedLab/gopeed"
  version "1.7.0"
  
  on_arm do
    url "https://github.com/GopeedLab/gopeed/releases/download/v1.7.0/gopeed-web-v1.7.0-macos-arm64.zip"
    sha256 "834f12788a764656cc35e3119c5c48bc2312a2d6d850952ccfc808e3b1193f61"
  end
  
  on_intel do
    url "https://github.com/GopeedLab/gopeed/releases/download/v1.7.0/gopeed-web-v1.7.0-macos-amd64.zip"
    sha256 "06306de3920661c72c7c7f5b838b516af56105bd2eaf5d8650453408935d3bbb"
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