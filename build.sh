#!/bin/bash

unset LD ARCH
export CFLAGS="-idirafter $CONDA_PREFIX/include" 
export LDFLAGS="-L$CONDA_PREFIX/lib"
export EIGEN_CFLAGS="-idirafter $CONDA_PREFIX/include/eigen3"
mkdir -p "$PREFIX/bin"
mkdir -p "$PREFIX/lib"
mkdir -p "$PREFIX/share"
./configure && ./build && cp -r bin lib share "$PREFIX"
