#!/bin/bash

set -e

cd /root
mkdir workspace; cd workspace
git clone --depth 1 -b release_40 https://github.com/llvm-mirror/clang clang_source
git clone --depth 1 https://github.com/intel/opencl-clang common_clang
git clone --depth 1 https://github.com/intel/llvm-patches llvm_patches
git clone --depth 1 -b release_40 https://github.com/llvm-mirror/llvm llvm_source
git clone --depth 1 https://github.com/intel/intel-graphics-compiler igc
git clone --depth 1 https://github.com/KhronosGroup/OpenCL-Headers opencl_headers

mkdir build; cd build
cmake -DIGC_OPTION__OUTPUT_DIR=../igc-install/Release \
    -DCMAKE_BUILD_TYPE=Release -DIGC_OPTION__ARCHITECTURE_TARGET=Linux64 \
    ../igc/IGC
make -j 2

