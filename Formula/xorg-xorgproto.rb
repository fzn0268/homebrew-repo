class XorgXorgproto < Formula
  desc "X.Org combined protocol headers"
  homepage "https://github.com/freedesktop/xorg-xorgproto"
  url "https://github.com/freedesktop/xorg-xorgproto/archive/xorgproto-2020.1.tar.gz"
  sha256 "fb5ef1fd347c0259ceddb03373ad9e2cdf669413afb00878b39cd2aebb2ce129"
  license ""

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libx11"

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
    # software. Run the test with `brew test xorg-xorgproto`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
