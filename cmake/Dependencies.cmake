# Copyright (c) 2025 Skye Benson
#
# This software is released under the MIT License.
# https://opensource.org/licenses/MIT

## TODO: Add File Header

##--------------------------------------------------------------------------------------------------------------------##
## CPM Dependency Manager

file(
   DOWNLOAD
   https://github.com/cpm-cmake/CPM.cmake/releases/download/v0.40.5/CPM.cmake
   ${CMAKE_CURRENT_BINARY_DIR}/cmake/CPM.cmake
)
include(CPM)

##--------------------------------------------------------------------------------------------------------------------##
