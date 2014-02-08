require "formula"

class Xproto < Formula
  homepage "http://x.org"
  url "http://xorg.freedesktop.org/archive/individual/proto/xproto-7.0.25.tar.gz"
  sha1 "ee6c54c0180ecb2adfa6d6201f26a1fb9244f047"

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
