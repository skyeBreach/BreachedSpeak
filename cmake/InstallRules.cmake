# Copyright (c) 2025 Skye Benson
#
# This software is released under the MIT License.
# https://opensource.org/licenses/MIT

##--------------------------------------------------------------------------------------------------------------------##
## Install Guards

if(CMAKE_SKIP_INSTALL_RULES)
    return()
endif()

##--------------------------------------------------------------------------------------------------------------------##
## Install Config

include(CMakePackageConfigHelpers)
include(GNUInstallDirs)

## TODO: Move elsewhere
## TODO: Comment
##
if(PROJECT_IS_TOP_LEVEL)
  set(
      CMAKE_INSTALL_INCLUDEDIR "include/BreachedSpeak-${PROJECT_VERSION}"
      CACHE STRING ""
  )
  set_property(CACHE CMAKE_INSTALL_INCLUDEDIR PROPERTY TYPE PATH)
endif()

## TODO: Update to be a useful directory structure
## TODO: Move to ProjectOptions
## TODO: Comment
##
set(INCLUDE_INSTALL_DIR
    ${CMAKE_INSTALL_INCLUDEDIR}/BreachedSpeak
    CACHE PATH "Location of header files"
)

## TODO: Rewrite help text
## TODO: Rewrite Comment
# Allow package maintainers to freely override the path for the configs
set(BreachedSpeak_INSTALL_LIBDIR
    "${CMAKE_INSTALL_LIBDIR}/cmake/BreachedSpeak"
    CACHE STRING "CMake package config location relative to the install prefix"
)
set_property(CACHE BreachedSpeak_INSTALL_LIBDIR PROPERTY TYPE PATH)
mark_as_advanced(BreachedSpeak_INSTALL_LIBDIR)

##--------------------------------------------------------------------------------------------------------------------##
## Directories and Targets

## TODO: Target Install
## TODO: Generate BuildInfo.h

## Install the public headers directories
install(
    DIRECTORY
        "include/"
        "${PROJECT_BINARY_DIR}/include/"
    DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}"
    COMPONENT BreachedSpeak_Development
)

## TODO: Comment
##
install(
    TARGETS
        BreachedSpeak
        BreachedSpeak_Options
    EXPORT BreachedSpeakTargets
    ARCHIVE
        DESTINATION "${CMAKE_INSTALL_LIBDIR}"
        COMPONENT lib
    RUNTIME
        DESTINATION "${CMAKE_INSTALL_BINDIR}"
        COMPONENT bin
    INCLUDES
        DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}"
)

##--------------------------------------------------------------------------------------------------------------------##
## Package Config Files

## TODO: Fix directory structure
## TODO: Package Configuration File
## TODO: Export
## TODO: Make sure it generates a shared lib (.dll)

## Generate the config file for BreachedSpeak
configure_package_config_file(CMake/BreachedSpeakConfig.cmake.in
	"${PROJECT_BINARY_DIR}/BreachedSpeakConfig.cmake"
	INSTALL_DESTINATION "${BreachedSpeak_INSTALL_LIBDIR}"
	PATH_VARS INCLUDE_INSTALL_DIR
)

## Creates a version file
write_basic_package_version_file(BreachedSpeakConfigVersion.cmake
    VERSION ${PROJECT_VERSION}
    COMPATIBILITY SameMajorVersion
)

## Install the generated files
install(
    FILES
        ${PROJECT_BINARY_DIR}/BreachedSpeakConfig.cmake
        ${PROJECT_BINARY_DIR}/BreachedSpeakConfigVersion.cmake
    DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/BreachedSpeak
)

## TODO: Comment
##
install(
    EXPORT BreachedSpeakTargets
    NAMESPACE BreachedSpeak::
    DESTINATION "${BreachedSpeak_INSTALL_LIBDIR}"
    COMPONENT BreachedSpeak_Development
)

##--------------------------------------------------------------------------------------------------------------------##
