class GopeedWeb < Formula
  desc "A modern download manager that supports all platforms. Built with Golang and Flutter."
  homepage "https://github.com/GopeedLab/gopeed"
  version "1.7.1"
  
  on_arm do
    url "https://github.com/GopeedLab/gopeed/releases/download/v1.7.1/gopeed-web-v1.7.1-macos-arm64.zip"
    sha256 "98199a96d8dfaf5299a9c060e0dca350e61491378e290de85c5be8a8f176b80d"
  end
  
  on_intel do
    url "https://github.com/GopeedLab/gopeed/releases/download/v1.7.1/gopeed-web-v1.7.1-macos-amd64.zip"
    sha256 "ac82adb54dcaf1458938b70f2c9f4b291a904b934da4bda4561a3631f5441fbe"
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