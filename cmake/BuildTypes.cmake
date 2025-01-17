# Copyright (c) 2025 Skye Benson
#
# This software is released under the MIT License.
# https://opensource.org/licenses/MIT

## TODO: File Header

##--------------------------------------------------------------------------------------------------------------------##
## Multi-Config Generator

if(GENERATOR_IS_MULTI_CONFIG)
    ## TODO: Make this only run if we are verbose
    ## Prints the current log level
    add_custom_target(genexdebug COMMAND ${CMAKE_COMMAND} -E echo "Build Type: $<CONFIG>")
endif()

##--------------------------------------------------------------------------------------------------------------------##
## Single-Config Generator

if(NOT GENERATOR_IS_MULTI_CONFIG)
    ## Set the possible build types, where the initial element is the default value
    set(BUILD_TYPES
        "Debug"
        "Release"
        "MinSizeRel"
        "RelWithDebInfo"
    )

    ## Set the default build type based on the defined list of build types
    set(DEFAULT_BUILD_TYPE_INDEX 0)
    list(GET BUILD_TYPES ${DEFAULT_BUILD_TYPE_INDEX} DEFAULT_BUILD_TYPE)

    ## Set the build type to the default, if none supplied
    if(NOT CMAKE_BUILD_TYPE)
        message(STATUS "Setting the build type to ${DEFAULT_BUILD_TYPE} as one wasn't specified!")
        set(CMAKE_BUILD_TYPE
            ${DEFAULT_BUILD_TYPE}
            CACHE STRING "Choose the build type to use" FORCE
        )
    endif()

    ## Set the possible build types, to the defined list above for CMake-GUI
    set_property(
        CACHE CMAKE_BUILD_TYPE
        PROPERTY STRINGS ${BUILD_TYPES}
    )
endif()

##--------------------------------------------------------------------------------------------------------------------##
