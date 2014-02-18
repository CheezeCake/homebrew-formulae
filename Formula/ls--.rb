require "formula"

class Ls-- < Formula
  homepage "https://github.com/trapd00r/ls--"
  url "https://github.com/trapd00r/ls--/archive/v0.340.tar.gz"
  sha1 "0855e74b89d93cb19c6bd702b0d257434de2cc3b"

  head "https://github.com/trapd00r/ls--.git"

  def install
    system "perl", "Makefile.PL"
    system "make"
    system "make", "install"
  end

  def caveats; <<-EOS.undent
    copy default config file:
        cp #{prefix}/ls++.conf ~/.ls++.conf
    EOS
  end
end
