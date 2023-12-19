class Libt3widget < Formula
  desc "The libt3widget library provides a C++ dialog toolkit. It provides objects for dialogs and widgets like buttons, text fields, check boxes etc., to facilitate easy construction of dialog based programs for Un*x terminals"
  homepage "https://os.ghalkes.nl/t3/libt3widget.html"
  url "https://os.ghalkes.nl/dist/libt3widget-1.2.2.tar.bz2"
  sha256 "9eb7e1d0ccdfc917f18ba1785a2edb4faa6b0af8b460653d962abf91136ddf1c"
  license "GPL-3.0-only"

  depends_on "gcc" => :build
  depends_on "libtool" => :build
  depends_on "gettext"
  depends_on "libt3key"
  depends_on "libt3window"

  fails_with :clang do
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
