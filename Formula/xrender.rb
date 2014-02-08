require "formula"

class Xrender < Formula
  homepage "http://x.org"
  url "http://xorg.freedesktop.org/archive/individual/lib/libXrender-0.9.8.tar.gz"
  sha1 "6fa642737be327cd7166995a626d429669e16a76"

  depends_on :x11
  depends_on 'pkg-config' => :build
  depends_on 'renderproto'

  def install
    system "./configure", "--prefix=#{prefix}"

    system "make", "install"
  end
end
