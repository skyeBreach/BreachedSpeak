# Copyright (c) 2025 Skye Benson
# 
# This software is released under the MIT License.
# https://opensource.org/licenses/MIT

echo Removing the 'out' directory
rm -rf out
echo

echo Configuring CMake:
cmake -B out/build -S . -G Ninja -D CMAKE_BUILD_TYPE=Debug -D BUILD_SHARED_LIBS=OFF
echo

echo Building CMake:
cmake --build out/build
echo

echo Installing Package:
cmake --install out/build --prefix out/install
echo
