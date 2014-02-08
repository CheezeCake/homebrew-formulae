require "formula"

class Renderproto < Formula
  homepage "http://x.org"
  url "http://xorg.freedesktop.org/archive/individual/proto/renderproto-0.11.tar.gz"
  sha1 "69c6cbae5e67d3a47b31dbf4d711607545e1bb05"

  depends_on :x11

  def install
    system "./configure", "--prefix=#{prefix}"

    system "make", "install"
  end
end
