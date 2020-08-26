class Libt3widget < Formula
  desc "The libt3widget library provides a C++ dialog toolkit. It provides objects for dialogs and widgets like buttons, text fields, check boxes etc., to facilitate easy construction of dialog based programs for Un*x terminals"
  homepage "https://os.ghalkes.nl/doc/libt3widget/"
  url "http://deb.debian.org/debian/pool/main/libt/libt3widget/libt3widget_1.2.0.orig.tar.bz2"
  sha256 "5c6d907ff3cf2a2379d4e928a1f18c16ed2e7e9301b66d3560d69e45f9e6667d"
  license "GPL-3.0-only"

  depends_on "gcc" => :build
  depends_on "libtool" => :build
  depends_on "gettext"
  depends_on "libt3key"
  depends_on "libt3window"

  fails_with :clang do
    build 900
    cause "Need libstdc++"
  end

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}",
                          "--without-x11",
                          "--without-gpm",
                          "LIBTOOL=#{Formula["libtool"].opt_bin}/glibtool",
                          "CXX=g++"
    system "make", "all"
    system "make", "install"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test libt3widget`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
