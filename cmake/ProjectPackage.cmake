# Copyright (c) 2025 Skye Benson
#
# This software is released under the MIT License.
# https://opensource.org/licenses/MIT

## TODO: File Header
## TODO: Option to enable/disable packaging

##--------------------------------------------------------------------------------------------------------------------##
## Include Guards

include_guard(DIRECTORY)

if(NOT BreachedSpeak_DEVELOPER_MODE)
    return()
endif()

##--------------------------------------------------------------------------------------------------------------------##
## CPack Config

## Base Project Information
set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})

##--------------------------------------------------------------------------------------------------------------------##
## Packager

## Only include CPack if we havent included it yet
## This guard is at the bottom as we may want to utilize other packagers
if(BreachedSpeak_GUARD_RUN_CPACK)
    return()
else()
    include(CPack)
    set(BreachedSpeak_GUARD_RUN_CPACK TRUE)
endif()

##--------------------------------------------------------------------------------------------------------------------##
