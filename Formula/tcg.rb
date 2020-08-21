class Tcg < Formula
  desc "This is 'tcg', a test-card (or test pattern) generator"
  homepage "https://github.com/nevali/tcg"
  license "Apache-2.0"
  head "https://github.com/nevali/tcg.git"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libpng" => :recommended
  depends_on "jasper" => :optional
  depends_on "jpeg" => :optional
  depends_on "libtiff" => :optional

  def install
    system "autoreconf", "-i"
    system "./configure",
            build.with?("libtiff") ? "--with-libtiff=#{Formula["libtiff"].opt_prefix}" : "--without-libtiff",
            build.with?("jpeg") ? "--with-libjpeg=#{Formula["jpeg"].opt_prefix}" : "--without-libjpeg",
            build.with?("jasper") ? "--with-libjasper=#{Formula["jasper"].opt_prefix}" : "--without-libjasper",
            "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test tcg`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "#{bin}/tcg", "-s", "720x576", "-t", "ebu100", "png-rgb16:ebu100.png"
  end
end
