class Libxcb < Formula
  desc "This package contains the library files needed to run software using libxcb-composite, the composite extension for the X C Binding"
  homepage "https://xcb.freedesktop.org/"
  url "https://xcb.freedesktop.org/dist/libxcb-1.14.tar.xz"
  sha256 "a55ed6db98d43469801262d81dc2572ed124edc3db31059d4e9916eb9f844c34"
  license ""

  depends_on "libpthread-stubs"
  depends_on "libxau"
  depends_on "xcb-proto"

  def install
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
    # software. Run the test with `brew test libxcb`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
