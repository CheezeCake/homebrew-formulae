require "formula"

class Mono < Formula
  homepage "http://mono-project.com"
  #url "http://download.mono-project.com/sources/mono/mono-3.2.6.tar.bz2"
  url "http://download.pokorra.de/mono/tarballs/mono-3.2.6.tar.bz2"
  #sha1 "27a08194f21ab853c669f42a1435e3a6fc326b8b"
  sha256 "a8aa127fefe0eb5b9fd2bfbf42d83713f2c0b9483244f4b6b9e972aa85194a68"

  depends_on :x11
  depends_on 'libgdiplus'
  depends_on 'glib'
  depends_on 'gettext'
  depends_on 'pkg-config' => :build

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--with-gc=included",
                          "--with-preview=yes",
                          "--disable-dtrace",
                          "--prefix=#{prefix}"

    system "make"
    system "make", "install"
  end
end
