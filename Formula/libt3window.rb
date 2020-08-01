# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Libt3window < Formula
  desc "The libt3window library provides functions for manipulating the terminal and for creating (possibly overlapping) windows on a terminal. libt3window can be used instead of (n)curses for drawing on the terminal."
  homepage "https://os.ghalkes.nl/doc/libt3window/"
  url "http://deb.debian.org/debian/pool/main/libt/libt3window/libt3window_0.4.0.orig.tar.bz2"
  sha256 "7ebceee248a6032eef1cf00b2cd20aa5a7a14114441b40bacdec03858ce40d63"
  license "GPL-3.0"

  # depends_on "cmake" => :build
  depends_on "libtool"
  depends_on "gettext"
  depends_on "libtranscript"

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}",
                          "LIBTOOL=/usr/local/bin/glibtool"
#			  ,"CXX=g++"
    # system "cmake", ".", *std_cmake_args
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
