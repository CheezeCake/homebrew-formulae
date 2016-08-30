require "formula"

class Lsxx < Formula
  homepage "https://github.com/trapd00r/ls--"
  url "https://github.com/trapd00r/ls--/archive/v0.340.tar.gz"
  sha256 "6f209318ab37bcf89d1ee2a6a16b993a514f2c0adf7ade7d694d5a64c80f1ffe"

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
