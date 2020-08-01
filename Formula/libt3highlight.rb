# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Libt3highlight < Formula
  desc "The libt3highlight library provides functions for syntax-highlighting different types of text files. Its main design goal is an easily restartable syntax highlighting, suitable for use in interactive text editors."
  homepage "https://os.ghalkes.nl/doc/libt3highlight/"
  url "http://deb.debian.org/debian/pool/main/libt/libt3highlight/libt3highlight_0.5.0.orig.tar.bz2"
  sha256 "8216190785e52a116f9f78ec6513815745904c2aaf70d0a0a09438e08640dfbb"
  license "GPL-3.0"

  # depends_on "cmake" => :build
  depends_on "libt3config"

#  fails_with :clang do
#            build 900
#            cause "Need gcc"
#  end

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}",
                          "LIBTOOL=/usr/local/bin/glibtool"
#                          ,"CXX=g++"
    # system "cmake", ".", *std_cmake_args
    system "make", "all"
    system "make", "install"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test libt3highlight`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
