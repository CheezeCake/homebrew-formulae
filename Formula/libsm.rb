require "formula"

class Libsm < Formula
  homepage "http://x.org"
  url "http://xorg.freedesktop.org/archive/individual/lib/libSM-1.2.2.tar.gz"
  sha1 "d8ac4f24e6a2783387982828c695f2716e337a13"

  depends_on :x11
  depends_on 'pkg-config' => :build
  depends_on 'xtrans' => :build
  depends_on 'libice'

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--without-libuuid",
                          "--without-xmlto",
                          "--without-fop",
                          "--disable-docs"
                          "--prefix=#{prefix}"

    system "make", "install"
  end
end
