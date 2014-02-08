require "formula"

class Mono < Formula
  homepage "http://mono-project.com"
  #url "http://download.mono-project.com/sources/mono/mono-3.2.6.tar.bz2"
  url "http://download.pokorra.de/mono/tarballs/mono-3.2.6.tar.bz2"
  #sha1 "27a08194f21ab853c669f42a1435e3a6fc326b8b"
  sha1 "fd40c7ec7b91986ebcc06474d2891112b91a8882"

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
