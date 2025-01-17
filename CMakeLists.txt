# Copyright (c) 2025 Skye Benson
#
# This software is released under the MIT License.
# https://opensource.org/licenses/MIT

##--------------------------------------------------------------------------------------------------------------------##
## Pre-Project Configuration

cmake_minimum_required(VERSION 3.31 FATAL_ERROR)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

include(Prelude)

##--------------------------------------------------------------------------------------------------------------------##
## Project Definition

## Project Definition
project(
    BreachedSpeak
    VERSION         1.0.0
    DESCRIPTION     "A library that contains helper objects, functions, and variables that are useful in the creation of TeamSpeak3 client plugins."
    HOMEPAGE_URL    "https://github.com/skyeBreach/breached-teamspeak"
    LANGUAGES       CXX C
)

## Project ID
string(MAKE_C_IDENTIFIER ${PROJECT_NAME} PROJECT_ID)
string(TOUPPER ${PROJECT_ID} PROJECT_ID)

## Project Author
set(PROJECT_AUTHOR_NAME                "skyeBreach")
set(PROJECT_AUTHOR_HOMEPAGE            "https://github.com/skyeBreach")

##--------------------------------------------------------------------------------------------------------------------##
## Project Config

## Import module that defines the options to use for this project
include(ProjectOptions)

## Define CMakes Output Dirs
#set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib")
#set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib")
#set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin")

##--------------------------------------------------------------------------------------------------------------------##
## Library Targets

## TODO: This should generate both the static and shared in future
## TODO: Compile Flags
## TODO: Export Header

## Add standard library target aswell as an alias'd namespace target
add_library(BreachedSpeak
    source/Plugin.cpp
)
add_library(BreachedSpeak::BreachedSpeak ALIAS BreachedSpeak)

## TODO: Comment
##
set_target_properties(BreachedSpeak
    PROPERTIES
        VERSION ${PROJECT_VERSION}
        SOVERSION ${PROJECT_VERSION_MAJOR}
        CXX_VISIBILITY_PRESET hidden
        VISIBILITY_INLINES_HIDDEN YES
        EXPORT_NAME BreachedSpeak
        OUTPUT_NAME BreachedSpeak
        PREFIX ""
)

## TODO: Comment
##
target_link_libraries(BreachedSpeak
    PRIVATE
        BreachedSpeak_Options
)

include(GenerateExportHeader)
## TODO: Comment
##
generate_export_header(BreachedSpeak
    EXPORT_FILE_NAME ${PROJECT_BINARY_DIR}/include/BreachedSpeak/BreachedSpeak_export.h
)

## TODO: Comment
##
target_include_directories(BreachedSpeak
	PUBLIC
        "$<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/include>"
        "$<BUILD_INTERFACE:${PROJECT_BINARY_DIR}/include>"
)

## Set the C++ standard to use for this project
target_compile_features(BreachedSpeak PUBLIC cxx_std_17)


##--------------------------------------------------------------------------------------------------------------------##
## Install Rules

include(InstallRules)

##--------------------------------------------------------------------------------------------------------------------##
## Documentation


##--------------------------------------------------------------------------------------------------------------------##
## Tests


##--------------------------------------------------------------------------------------------------------------------##
## Examples


##--------------------------------------------------------------------------------------------------------------------##
## Packaging


##--------------------------------------------------------------------------------------------------------------------##
