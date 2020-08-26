class Libt3config < Formula
  desc "The libt3config library provides functions for reading and writing simple structured configuration files. It provides a simple structured syntax and typed data, a simple API for reading and manipulating configurations, and schema definitions allowing the verification of the structure of loaded configuration data"
  homepage "https://os.ghalkes.nl/doc/libt3config/"
  url "http://deb.debian.org/debian/pool/main/libt/libt3config/libt3config_1.0.0.orig.tar.bz2"
  sha256 "1aba7262ed79b11b30f93d02183aafde49c9d6655f08ac438b26af3151908c01"
  license "GPL-3.0-only"

  depends_on "libtool" => :build
  depends_on "gettext"

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
    # software. Run the test with `brew test libt3config`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
