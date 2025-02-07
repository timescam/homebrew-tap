class Dvdts < Formula
  desc "Terminal screensaver similar to dvd bouncing logo; Uses the distro/OS name/custom text instead"
  homepage "https://github.com/ameyrk99/dvdts"
  head "https://github.com/ameyrk99/dvdts.git", branch: "master"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    assert_match "dvdts", shell_output("#{bin}/dvdts -h 2>&1")
  end
end