require 'formula'

class Sfml2 < Formula
  homepage 'http://www.sfml-dev.org'
  url 'http://www.sfml-dev.org/download/sfml/2.1/SFML-2.1-sources.zip'
  sha1 'c27bdffdc4bedb5f6a20db03ceca715d42aa5752'

  head 'https://github.com/LaurentGomila/SFML.git'

  option :universal
  option 'with-c++11', 'Compile with Clang and stdlib=libc++ for C++11 features' if MacOS.version >= :lion
  option 'with-docs', 'install SFML\'s html documentation'

  depends_on 'cmake' => :build
  depends_on 'doxygen' if build.with? 'docs'

  def install
    ENV.universal_binary if build.universal?

    args = ["-DCMAKE_INSTALL_FRAMEWORK_PREFIX=#{prefix}"]
    args << "-DSFML_BUILD_DOC=1" if build.include? 'with-docs'

    if MacOS.version >= :lion and build.include? 'with-c++11'
      args << "-DCMAKE_CXX_COMPILER=/usr/bin/clang++"
      args << "-DCMAKE_C_COMPILER=/usr/bin/clang"
      args << "-DCMAKE_CXX_FLAGS=-stdlib=libc++"
      args << "-DCMAKE_C_FLAGS=-stdlib=libc++"
    end

    system "cmake", ".", *(std_cmake_args+args)
    system "make", "install"
  end

  def caveats; <<-EOS.undent
    To complete the install run:
    sudo ln -s #{prefix}/freetype.framework /Library/Frameworks
    sudo ln -s #{prefix}/sndfile.framework /Library/Frameworks
    EOS
  end
end
