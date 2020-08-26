class Libt3key < Formula
  desc "The libt3key library provides functions for retrieving the character sequences used by terminals to represent keys pressed by the user. Although the terminfo database provides part of this information, it lacks information for the sequences returned by modern terminals/terminal emulators for many combinations of modifiers with other keys. For example, many terminal emulators provide separate character sequences for Control combined with the cursor keys, which is not stored in the terminfo database"
  homepage "https://os.ghalkes.nl/doc/libt3key/"
  url "http://deb.debian.org/debian/pool/main/libt/libt3key/libt3key_0.2.10.orig.tar.bz2"
  sha256 "b3f63c8a5bdf4efc10a293e5124a4a1095af6149af96b0a10b3ce7da7400f8c1"
  license "GPL-3.0-only"

  depends_on "libtool" => :build
  depends_on "gettext"
  depends_on "libt3config"

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}",
                          "LIBTOOL=#{Formula["libtool"].opt_bin}/glibtool"
    system "make", "all"
    system "make", "install"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test libt3key`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
