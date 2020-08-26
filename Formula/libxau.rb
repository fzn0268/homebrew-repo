class Libxau < Formula
  desc "This package provides the main interface to the X11 authorisation handling, which controls authorisation for X connections, both client-side and server-side"
  homepage "https://gitlab.freedesktop.org/xorg/lib/libxau"
  url "git://anongit.freedesktop.org/git/xorg/lib/libXau",
      tag:      "libXau-#{version}",
      revision: "d9443b2c57b512cfb250b35707378654d86c7dea"
  version "1.0.9"
  license ""
  head "git://anongit.freedesktop.org/git/xorg/lib/libXau"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "xorg-xorgproto"

  def install
    system "./autogen.sh"
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test libXau`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
