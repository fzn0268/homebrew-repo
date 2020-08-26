class Libtranscript < Formula
  desc "libtranscript is a character-set conversion library, much like the iconv set of functions. The library allows great control over the conversions. It was designed for use in programs which use Unicode internally, using UTF-8, UTF-16 or UTF-32/UCS-4."
  homepage "https://os.ghalkes.nl/libtranscript.html"
  url "https://os.ghalkes.nl/dist/libtranscript-0.3.3.tar.bz2"
  sha256 "1f8c19f257da5d6fad0ed9a7e5bd2442819e910a19907c38e115116a3955f5fa"
  license "GPL-3.0-only"

  depends_on "gettext"
  depends_on "libtool" => :build

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
    # software. Run the test with `brew test libtranscript`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
