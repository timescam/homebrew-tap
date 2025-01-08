class Peaclock < Formula
  desc "Terminal-based clock and timer with a customizable color palette"
  homepage "https://github.com/octobanana/peaclock"
  head "https://github.com/octobanana/peaclock.git", branch: "master"

  depends_on "cmake" => :build
  depends_on "gcc@14" => :build
  depends_on "icu4c"

  def install
    system "./RUNME.sh", "build", "--", 
           "-DCMAKE_CXX_COMPILER=#{Formula["gcc@14"].opt_bin}/g++-14",
           "-DCMAKE_CXX_FLAGS=-I#{Formula["icu4c"].opt_include} -L#{Formula["icu4c"].opt_lib}"
    
    bin.install "build/release/peaclock"
  end

  test do
    system "#{bin}/peaclock", "--version"
  end
end 