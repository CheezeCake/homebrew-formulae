require 'formula'

class EbookTools < Formula
  homepage 'http://ebook-tools.sourceforge.net/'
  url 'http://kent.dl.sourceforge.net/project/ebook-tools/ebook-tools/0.2.2/ebook-tools-0.2.2.tar.gz'
  sha1 '1f10bef62c9125cf804366134e486a58308f07ff'

  depends_on 'cmake' => :build
  depends_on 'libzip'

  def install
    args = ["-DCMAKE_C_FLAGS=-I#{Formula.factory('libzip').opt_prefix}/lib/libzip/include"]
    system "cmake", ".", *(std_cmake_args+args)
    system "make", "install"
  end
end
