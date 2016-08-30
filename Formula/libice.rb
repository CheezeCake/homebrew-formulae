require "formula"

class Libice < Formula
  homepage "http://x.org"
  url "http://xorg.freedesktop.org/archive/individual/lib/libICE-1.0.8.tar.gz"
  sha256 "8332018b07ec38a4a35a360b39f7391c58d053ce5f676aa457b1a686b0277cc0"

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
                          "--disable-specs",
                          "--prefix=#{prefix}"

    system "make", "install"
  end
end
