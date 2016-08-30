require "formula"

class Xrender < Formula
  homepage "http://x.org"
  url "http://xorg.freedesktop.org/archive/individual/lib/libXrender-0.9.8.tar.gz"
  sha256 "c3acffff4cd5c91585e8c4fdf1ec29fc234482f661ed548112b4d52db19963d1"

  depends_on :x11
  depends_on 'pkg-config' => :build
  depends_on 'renderproto'

  def install
    system "./configure", "--prefix=#{prefix}"

    system "make", "install"
  end
end
