cmake_minimum_required(VERSION 3.9)

list(APPEND CMAKE_MODULE_PATH
  ${CMAKE_CURRENT_SOURCE_DIR}/cmake
  ${CMAKE_CURRENT_SOURCE_DIR}/projects)

if(APPLE)
  if(NOT CMAKE_OSX_SDK)
    execute_process(COMMAND xcrun --show-sdk-version
      OUTPUT_VARIABLE SDK_VERSIOM
      RESULT_VARIABLE res
      OUTPUT_STRIP_TRAILING_WHITESPACE)
    if(res)
      message(FATAL_ERROR "Failed to detect CMAKE_OSX_SDK.")
    endif()
    set(CMAKE_OSX_SDK macosx${SDK_VERSIOM})
  endif()

  if(NOT CMAKE_OSX_SYSROOT)
    execute_process(COMMAND xcodebuild -sdk ${CMAKE_OSX_SDK} -version Path
      OUTPUT_VARIABLE CMAKE_OSX_SYSROOT
      RESULT_VARIABLE res
      OUTPUT_STRIP_TRAILING_WHITESPACE)
    if(res)
      message(FATAL_ERROR "Failed to detect SDK path for: ${CMAKE_OSX_SDK}")
    endif()
  endif()

  if(NOT CMAKE_OSX_DEPLOYMENT_TARGET)
    execute_process(COMMAND xcodebuild -sdk ${CMAKE_OSX_SDK} -version SDKVersion
      OUTPUT_VARIABLE CMAKE_OSX_DEPLOYMENT_TARGET
      RESULT_VARIABLE res
      OUTPUT_STRIP_TRAILING_WHITESPACE)
    if(res)
      message(FATAL_ERROR "Failed to detect SDK version for: ${CMAKE_OSX_SDK}")
    endif()
  endif()
endif()

project(ParamountExternal VERSION 1.0.0)

option(BUILD_TESTING "Build with tests" ON)
if(BUILD_TESTING)
  enable_testing()
endif()

set(platform)
if(APPLE)
  set(platform "apple")
elseif(UNIX)
  set(platform "unix")
elseif(WIN32)
  set(platform "win")
endif()

include(CheckTypeSize)
check_type_size(void* VOID_PTR_SIZE BUILTIN_TYPES_ONLY)
if(VOID_PTR_SIZE EQUAL 8)
  set(platform ${platform}-64bit)
else()
  set(platform ${platform}-32bit)
endif()

set(install_location ${CMAKE_CURRENT_BINARY_DIR}/install)
set(download_location ${CMAKE_CURRENT_BINARY_DIR}/downloads CACHE PATH
  "Location where source tarballs are (to be) downloaded.")
mark_as_advanced(download_location)

include(ExternalProject)
include(Versions)

# Include all projects
include(qt)
include(boost)
include(gtest)

# Install all build artifacts into common install directory
install(DIRECTORY ${install_location} DESTINATION .)
include(paramount.bundle)