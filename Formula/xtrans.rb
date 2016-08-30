require "formula"

class Xtrans < Formula
  homepage "http://x.org"
  url "http://xorg.freedesktop.org/archive/individual/lib/xtrans-1.3.3.tar.gz"
  sha256 "afb636c4efc8aec006ffc829e88337327b82206c8ece1e91e1afcc2f0732083b"

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
