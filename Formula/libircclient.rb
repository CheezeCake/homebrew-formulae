class Libircclient < Formula
  desc "Small but powerful library, which implements client-server IRC protocol"
  homepage "http://www.ulduzsoft.com/libircclient/"
  url "http://downloads.sourceforge.net/sourceforge/libircclient/libirclient-1.8.tar.gz"
  sha256 "2cf8523ac683588f2785b08159a2df3e4d15939ee655c0024aa86334149de8f6"

  def install
    # system "./configure", "--prefix=#{prefix}", "--libdir=#{lib}", "--includedir=#{include}/libircclient"
    system "./configure", "--prefix=#{prefix}", "--libdir=#{lib}"
    inreplace "src/Makefile", "libircclient.so", "libircclient.a"
    inreplace "src/Makefile", "#{include}", "#{include}/libircclient"
    system "make", "install"
  end
end
