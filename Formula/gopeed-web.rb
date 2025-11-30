class GopeedWeb < Formula
  desc "A modern download manager that supports all platforms. Built with Golang and Flutter."
  homepage "https://github.com/GopeedLab/gopeed"
  version "1.8.3"
  
  on_arm do
    url "https://github.com/GopeedLab/gopeed/releases/download/v1.8.3/gopeed-web-v1.8.3-macos-arm64.zip"
    sha256 "9904787bb90461b8576342f71e2b5cf3840917c23e46856fa26f3bad23b2f699"
  end
  
  on_intel do
    url "https://github.com/GopeedLab/gopeed/releases/download/v1.8.3/gopeed-web-v1.8.3-macos-amd64.zip"
    sha256 "1a2b42fbcdf2bca6374ccd1e73c2414a94dcc6299b9f74a75ece6063f5e7b57b"
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