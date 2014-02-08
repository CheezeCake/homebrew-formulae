require "formula"

class Libgdiplus < Formula
  homepage "http://www.mono-project.com/Libgdiplus"
  url "http://download.mono-project.com/sources/libgdiplus/libgdiplus-2.10.9.tar.bz2"
  sha1 "5e127b818d9af032928c7f7cfba812c1231a8478"

  depends_on 'cairo'
  depends_on 'fontconfig'
  depends_on 'giflib'
  depends_on 'glib'
  depends_on 'jpeg'
  depends_on 'libexif'
  depends_on 'libpng12'
  depends_on 'libtiff'
  depends_on 'libsm'
  depends_on 'xrender'

  def patches
    # https://bugs.gentoo.org/show_bug.cgi?id=431916
    DATA
  end

  def install
    ENV['PKG_CONFIG'] = "#{Formula.factory('pkg-config').opt_prefix}/bin/pkg-config"
    ENV.append_to_cflags "-I#{Formula.factory('glib').opt_prefix}/include/glib-2.0"
    ENV.append_to_cflags "-I#{Formula.factory('glib').opt_prefix}/lib/glib-2.0/include"
    ENV.append_to_cflags "-I#{Formula.factory('cairo').opt_prefix}/include/cairo"

    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
						  "--without-libjpeg",
                          "--prefix=#{prefix}"

    system "make", "install"
  end
end

__END__
diff --git a/configure.in b/configure.in
index 6a0b10e..4863a41 100644
--- a/configure.in
+++ b/configure.in
@@ -245,7 +245,7 @@ AC_ARG_WITH([libjpeg],
         jpeg_ok=no)
       AC_MSG_RESULT($jpeg_ok)
       if test "$jpeg_ok" = yes; then
-        JPEG='jpeg'; LIBJPEG='-L${libjpeg_prefix}/lib -ljpeg'
+        JPEG='jpeg'; LIBJPEG="-L${libjpeg_prefix}/lib -ljpeg"
       else
         AC_MSG_WARN(*** JPEG loader will not be built (JPEG header file not found) ***)
       fi
