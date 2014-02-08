require "formula"

class Xtrans < Formula
  homepage "http://x.org"
  url "http://xorg.freedesktop.org/archive/individual/lib/xtrans-1.3.3.tar.gz"
  sha1 "b69c23988f8b8a384f9631e64e8afdc329d75860"

  depends_on :x11

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--without-xmlto",
                          "--without-fop",
                          "--disable-docs",
                          "--prefix=#{prefix}"

    system "make", "install"
  end
end
