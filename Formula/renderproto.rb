require "formula"

class Renderproto < Formula
  homepage "http://x.org"
  url "http://xorg.freedesktop.org/archive/individual/proto/renderproto-0.11.tar.gz"
  sha256 "256e4af1d3b4007872a276ed9e5c2522f80f5fe69b97268542917635b4dbf758"

  depends_on :x11

  def install
    system "./configure", "--prefix=#{prefix}"

    system "make", "install"
  end
end
