#!/usr/bin/env bash

lab_dir=$(pwd)
echo "Lab directory: $lab_dir"

echo "Deleting existing source files in testing directory and copying new ones"
rm -rf testing/mystring.cpp
rm -rf testing/mystring.hpp

cp mystring.cpp testing
cp mystring.hpp testing

cd testing

mkdir -p build
cd build

cmake ..
cmake --build . -j

../bin/gtester

cd $lab_dir
rm -rf testing/build testing/bin testing/lib_bin
