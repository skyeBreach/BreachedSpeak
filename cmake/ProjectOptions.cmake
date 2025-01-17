# Copyright (c) 2025 Skye Benson
#
# This software is released under the MIT License.
# https://opensource.org/licenses/MIT

# TODO: File/Module Header
# TODO: Option Import/Generate/Install Third Party Libraries (We only need to run these once, so we may as well check with the dev)
# TODO: Option Module Coverage
# TODO: Option Sanitizers (Not needed at the moment as MSVC (Windows) only supports address sanitizing)
# TODO: Option Cross Compiling

## TODO: Check if comment is correct and this is needed
## As this defines project options it can only be run once
include_guard(GLOBAL)

## Imports required by this module
include(CMakeDependentOption)

##--------------------------------------------------------------------------------------------------------------------##
## Utility Variables and Conditionals

## Set the verbosity based on the GET_MESSAGE_LOG_LEVEL
cmake_language(GET_MESSAGE_LOG_LEVEL LOG_LEVEL)
message(VERBOSE "Message Log Level: ${LOG_LEVEL}")

## Gets the global GENERATOR_IS_MULTI_CONFIG
get_cmake_property(GENERATOR_IS_MULTI_CONFIG IS_MULTI_CONFIG)
if(IS_MULTI_CONFIG)
    message(VERBOSE "Generator Config: Multi")
else()
    message(VERBOSE "Generator Config: Single")
endif()

##--------------------------------------------------------------------------------------------------------------------##
## Project Options Definition

## Developer Mode Options
## These 'Developer Mode' settings are only relevant for developer(s) of this project
## This can be activated as a user of the project but is set to an advanced option as it is not recommended
option(
    BreachedSpeak_DEVELOPER_MODE
    "Enable the developer mode for ${PROJECT_NAME}.\nWarning: if you are not directly altering/developing ${PROJECT_NAME}, this should not be activated!"
    ${PROJECT_IS_TOP_LEVEL}
)
if(NOT PROJECT_IS_TOP_LEVEL)
    mark_as_advanced(BreachedSpeak_DEVELOPER_MODE)
endif()

## Settings that should only be availble in developer mode
if(BreachedSpeak_DEVELOPER_MODE)

    ## Code Linting
    option(BreachedSpeak_ENABLE_CODE_LINTING
        "Enable the code linter (Clang-Tidy)"
        ON
    )

    ## Code Spell Checking
    cmake_dependent_option(BreachedSpeak_ENABLE_SPELL_CHECK
        "Enable the linter to spell check the code (CSpell)" ON
        "BreachedSpeak_ENABLE_CODE_LINTING" OFF
    )

    ## Code Formatting
    option(BreachedSpeak_ENABLE_CODE_FORMATER
        "Enable the automatic formatting of the code (Clang-Format)" ON
    )

    ## Static Analysis of Code
    ## Provides unique code analysis to detect bugs and focuses on detecting undefined behaviour and dangerous coding constructs.
    option(BreachedSpeak_ENABLE_STATIC_ANALYSIS
        "Enable static analysis of the code (CppCheck)"
        ON
    )

    ## Compilation Caching
    ## It speeds up recompilation by caching previous compilations and detecting when the same compilation is being done again.
    option(BreachedSpeak_ENABLE_CACHING
        "Enables compilation caching through the Ccache module"
        OFF
    )

    ## Warnings As Errors
    ## All warnings called by the build system will be promoted to a FATAL_ERROR stopping the current build
    option(BreachedSpeak_ENABLE_WARNINGS_AS_ERRORS
        "Should the build systems treat any recieved warning as an error?"
        ON
    )

    ## Unity Builds
    ## Creates unity sources to allow for target source file batching to speed up compilation
    option(BreachedSpeak_ENABLE_UNITY_BUILDS
        "Enables the creation of a set of unity sources that #include the origional sources and subsiquently compiling these sources, which allows for target source file batching which speeds up compilation"
        OFF
    )

    ## Code Test Building
    ## If the code tests (unit tests, etc) located in 'tests/' should be built
    option(BreachedSpeak_BUILD_TESTS
        "If the code tests (unit test, etc) found in '${CMAKE_SOURCE_DIR}/test/' should be built"
        ON
    )

    ## Documentation File Building
    ## If the documentation should be generated/built and outputted to the 'docs/' directory
    option(BreachedSpeak_BUILD_DOCUMENTATION
        "If the documentation should be built using [TODO: Say the docs built tools here] and outputted in '${CMAKE_SOURCE_DIR}/docs/'"
        ON
    )

    ## Example Project Building
    ## If the example projects found in 'examples/' should be built after the main project(s)
    option(BreachedSpeak_BUILD_EXAMPLES
        "If the examples projects provided in '${CMAKE_SOURCE_DIR}/examples/' should be built after the project.'"
        ON
    )

endif()

##--------------------------------------------------------------------------------------------------------------------##
## Standard Project Settings

if(PROJECT_IS_TOP_LEVEL)
    ## Use 'BuildTypes' module to correctly manage the build type
    include(BuildTypes)

    # Generate compile_commands.json to make it easier to work with clang based tools
    set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
endif()

##--------------------------------------------------------------------------------------------------------------------##
## Option Based Project Settings

## TODO: Warnings as Errors
## TODO: Sanitzers
## TODO: Coverage

## Interface library to contain all options used by the targets in this project
add_library(BreachedSpeak_Options INTERFACE)

## Unity Builds
set_target_properties(BreachedSpeak_Options PROPERTIES UNITY_BUILD ${BreachedSpeak_ENABLE_UNITY_BUILDS})

## Compiler Caching
if(BreachedSpeak_ENABLE_CACHING)
    include(Cache)
endif()

## Code Linting
if(BreachedSpeak_ENABLE_CODE_LINTING)
    ## Linting is done through "Clang-Tidy"
    include(ClangTidy)

    ## Code Spell Checking is done through [TODO the name of the spell checker to use)
    if(BreachedSpeak_ENABLE_SPELL_CHECK)
        include(SpellCheck)
    endif()
endif()

## Code Formatting
if(BreachedSpeak_ENABLE_CODE_FORMATER)
    include(ClangFormat)
endif()

## Code Static Analysis
if(BreachedSpeak_ENABLE_STATIC_ANALYSIS)
    include(CppCheck)
endif()

##--------------------------------------------------------------------------------------------------------------------##
