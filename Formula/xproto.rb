require "formula"

class Xproto < Formula
  homepage "http://x.org"
  url "http://xorg.freedesktop.org/archive/individual/proto/xproto-7.0.25.tar.gz"
  sha256 "e3dc634103f923a2276289745eb7b702b18cfc885ea4b2382bd35a8cc3d935cb"

  depends_on :x11

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--without-xmlto",
                          "--without-fop",
                          "--disable-specs",
                          "--prefix=#{prefix}"

    system "make", "install"
  end
end
