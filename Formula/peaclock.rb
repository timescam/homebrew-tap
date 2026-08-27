class Peaclock < Formula
  desc "Terminal-based clock and timer with a customizable color palette"
  homepage "https://github.com/octobanana/peaclock"
  head "https://github.com/octobanana/peaclock.git", branch: "master"

  depends_on "cmake" => :build
  depends_on "gcc@16" => :build
  depends_on "icu4c"

  def install
    args = [
      "-DCMAKE_CXX_COMPILER=#{Formula["gcc@16"].opt_bin}/g++-16",
      "-DCMAKE_CXX_FLAGS=-I#{Formula["icu4c"].opt_include} -mcpu=native",
    ]
    args << "-DCMAKE_OSX_ARCHITECTURES=#{Hardware::CPU.arch}" if OS.mac?

    system "./RUNME.sh", "build", "--", *args

    bin.install "build/release/peaclock"
  end

  test do
    system "#{bin}/peaclock", "--version"
  end
end
