class Tilde < Formula
  desc "Text editor for the console/terminal, which provides an intuitive interface for people accustomed to GUI environments such as Gnome, KDE and Windows"
  homepage "https://os.ghalkes.nl/tilde/"
  url "https://os.ghalkes.nl/dist/tilde-1.1.2.tar.bz2"
  sha256 "4e74d926e54ff9c1e4fdfbce8065f64a2cee4ef623569739efa8eae8bdb694ce"
  license "GPL-3.0-only"

  depends_on "gcc"
  depends_on "gettext"
  depends_on "libt3highlight"
  depends_on "libt3widget"
  depends_on "libtranscript"

  fails_with :clang do
    build 900
    cause "Need gcc"
  end

  def install
    system "sed", "-i.orig", "-e", 's|src\/tilde|src\/tilde1|g', "Makefile.in"
    system "sed", "-i.orig", "-e", 's|rm\ \-f\ \$\(_bindir\)\/tilde|rm\ \-f\ \$(_bindir)\/tilde1|g', "Makefile.in"
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}",
                          "CXX=g++"
    system "make", "all"
    system "make", "install"
    mv "#{bin}/tilde1", "#{bin}/tilde"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test tilde`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
