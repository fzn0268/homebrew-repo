class XcbProto < Formula
  desc "XCB proto provides the XML-XCB protocol descriptions that libxcb uses to generate the majority of its code and API"
  homepage "https://xcb.freedesktop.org/"
  url "https://xcb.freedesktop.org/dist/xcb-proto-1.14.tar.xz"
  sha256 "186a3ceb26f9b4a015f5a44dcc814c93033a5fc39684f36f1ecc79834416a605"
  license ""

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
    # software. Run the test with `brew test xcb-proto`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
