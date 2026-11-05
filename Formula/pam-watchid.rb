class PamWatchid < Formula
  desc "PAM module for Apple Watch and Touch ID authentication"
  homepage "https://github.com/mostpinkest/pam-watchid"
  license "Unlicense"
  head "https://github.com/mostpinkest/pam-watchid.git", branch: "main"

  depends_on :macos

  deny_network_access!

  def install
    # Not the Makefile: `make install` writes /usr/local/lib/pam with sudo,
    # `make enable` rewrites /etc/pam.d/sudo, and SwiftPM's sandbox cannot nest
    # inside Homebrew's (`std_swift_args` passes `--disable-sandbox`).
    system "swift", "build", *std_swift_args

    bin_path = Utils.safe_popen_read("swift", "build", "--show-bin-path", *std_swift_args).strip
    (lib/"pam").install "#{bin_path}/libpam-watchid.dylib" => "pam_watchid.so"
  end

  def caveats
    <<~EOS
      Add this line to /etc/pam.d/sudo_local (macOS 14 or later), or to
      /etc/pam.d/sudo on older versions, after any pam_tid.so line:

        auth    sufficient    #{opt_lib}/pam/pam_watchid.so

      Keep every existing auth line, and test in a second terminal: a broken
      PAM stack stops `sudo` working. This module can only offer the Watch,
      because `sudo` asks Local Authentication as root, which has no enrolled
      fingerprints; `pam_tid.so` ahead of it keeps Touch ID working.
    EOS
  end

  test do
    assert_match "pam_sm_authenticate", shell_output("nm -gU #{opt_lib/"pam"/"pam_watchid.so"}")
  end
end
