class Libt3window < Formula
  desc "The libt3window library provides functions for manipulating the terminal and for creating (possibly overlapping) windows on a terminal. libt3window can be used instead of (n)curses for drawing on the terminal."
  homepage "https://os.ghalkes.nl/t3/libt3window.html"
  url "https://os.ghalkes.nl/dist/libt3window-0.4.1.tar.bz2"
  sha256 "4c14d3f4f946637fd6c3fa23ef7511fa505880946e151406d5e16f645d24e792"
  license "GPL-3.0-only"

  depends_on "libtool" => :build
  depends_on "gettext"
  depends_on "libtranscript"

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
    # software. Run the test with `brew test libt3window`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
