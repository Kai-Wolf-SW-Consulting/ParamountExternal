ExternalProject_Add(gtest
  ${gtest_revision}
  DOWNLOAD_DIR ${download_location}
  INSTALL_DIR ${install_location}
  CMAKE_ARGS
    -Wno-dev
    -DBUILD_SHARED_LIBS=ON
    -DCMAKE_INSTALL_PREFIX=<INSTALL_DIR>
    -Dgtest_force_shared_crt=ON)
