class XorgMacros < Formula
  desc "X.org macros utilities"
  homepage "https://github.com/freedesktop/xorg-macros"
  url "https://github.com/freedesktop/xorg-macros/archive/util-macros-1.19.1.tar.gz"
  sha256 "353eca5062146b29933a5862f6bfb6d52cdbac4aff6f3ad8558a507e44ded52a"
  license ["Red Hat", "Oracle"]

  depends_on "autoconf" => :build
  depends_on "automake" => :build

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
    # software. Run the test with `brew test xorg-macros`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
