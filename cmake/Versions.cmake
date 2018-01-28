macro(add_revision name)
  set(${name}_revision "${ARGN}")
endmacro()

add_revision(boost
  URL http://sourceforge.net/projects/boost/files/boost/1.60.0/boost_1_60_0.tar.gz/download
  URL_MD5 28f58b9a33469388302110562bdf6188)

add_revision(qt
  URL http://download.qt.io/official_releases/qt/5.10/5.10.0/single/qt-everywhere-src-5.10.0.tar.xz
  URL_MD5 c5e275ab0ed7ee61d0f4b82cd471770d)

add_revision(gtest
  URL https://github.com/google/googletest/archive/release-1.8.0.tar.gz
  URL_MD5 16877098823401d1bf2ed7891d7dce36)

