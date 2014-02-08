require "formula"

class Libice < Formula
  homepage "http://x.org"
  url "http://xorg.freedesktop.org/archive/individual/lib/libICE-1.0.8.tar.gz"
  sha1 "22aa5898443e0652337f80796a3a33dc67cab8b6"

  depends_on :x11
  depends_on 'pkg-config' => :build
  depends_on 'xtrans' => :build
  depends_on 'xproto'

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--without-xmlto",
                          "--without-fop",
                          "--disable-docs",
                          "--disable-specs"
                          "--prefix=#{prefix}"

    system "make", "install"
  end
end
