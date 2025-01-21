# Copyright (c) 2025 Skye Benson
#
# This software is released under the MIT License.
# https://opensource.org/licenses/MIT

## TODO: File Header

##--------------------------------------------------------------------------------------------------------------------##
## Prelude Guards

## Include Guard
include_guard()

## In-Source Build Guard
if(CMAKE_SOURCE_DIR STREQUAL CMAKE_BINARY_DIR)
    message(
        FATAL_ERROR
        "In-source builds are not supported."
        "Please read the BUILDING document before trying to build this project."
        "You may need to delete 'CMakeCache.txt' and 'CMakeFiles/' first."
    )
endif()

## C++ Standard Guard
if(NOT DEFINED CMAKE_CXX_STANDARD)
    set(CMAKE_CXX_STANDARD 17)
endif()

##--------------------------------------------------------------------------------------------------------------------##
## CMake Default Project Modules

include(CMakePrintHelpers)

##--------------------------------------------------------------------------------------------------------------------##
## IDE Support

set_property(GLOBAL PROPERTY USE_FOLDERS ON)
set(IDE_FOLDER "")

##--------------------------------------------------------------------------------------------------------------------##
## Development Environment Tooling

include(dev-environment/EditorConfig)
GenerateEditorConfig()

##--------------------------------------------------------------------------------------------------------------------##
