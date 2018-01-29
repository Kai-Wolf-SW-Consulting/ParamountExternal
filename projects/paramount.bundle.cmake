# Enable CPack packaging.
set(CPACK_GENERATOR TGZ)
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "Paramount")
set(CPACK_PACKAGE_NAME "Paramount")
set(CPACK_PACKAGE_VENDOR "Kai Wolf - SW Consulting")
set(CPACK_PACKAGE_VERSION_MAJOR ${ParamountExternal_VERSION_MAJOR})
set(CPACK_PACKAGE_VERSION_MINOR ${ParamountExternal_VERSION_MINOR})
set(CPACK_PACKAGE_INSTALL_DIRECTORY "paramount")
set(CPACK_PACKAGE_VERSION_PATCH ${CPACK_PACKAGE_VERSION_PATCH})

set(CPACK_PACKAGE_FILE_NAME ${CPACK_PACKAGE_NAME}${ParamountExternal_VERSION}-${platform})
include(InstallRequiredSystemLibraries)
include(CPack)

add_test(GenerateParamountBundle-TGZ
  ${CMAKE_CPACK_COMMAND} -G TGZ
  WORKING_DIRECTORY ${ParamountExternal_BINARY_DIR})

add_test(GenerateParamountBundle-ZIP
  ${CMAKE_CPACK_COMMAND} -G ZIP
  WORKING_DIRECTORY ${ParamountExternal_BINARY_DIR})

set_tests_properties(
  GenerateParamountBundle-TGZ
  GenerateParamountBundle-TGZ
  PROPERTIES TIMEOUT 600)