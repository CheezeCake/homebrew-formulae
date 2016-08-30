require "formula"

class Libsm < Formula
  homepage "http://x.org"
  url "http://xorg.freedesktop.org/archive/individual/lib/libSM-1.2.2.tar.gz"
  sha256 "14bb7c669ce2b8ff712fbdbf48120e3742a77edcd5e025d6b3325ed30cf120f4"

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
                          "--disable-docs",
                          "--prefix=#{prefix}"

    system "make", "install"
  end
end
