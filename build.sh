#!/bin/bash
unset LD LINK ARCH
export CFLAGS="-idirafter $CONDA_PREFIX/include"
COMMON_LDFLAGS="-L$CONDA_PREFIX/lipb"
COMMON_LINKFLAGS="-L$CONDA_PREFIX/lib -Wl,-rpath,${CONDA_PREFIX}/lib"

# If running on macOS, add the headerpad flag.
if [ "$(uname)" = "Darwin" ]; then
    export LDFLAGS="${COMMON_LDFLAGS} -Wl,-headerpad_max_install_names"
    export LINKFLAGS="${COMMON_LINKFLAGS} -Wl,-headerpad_max_install_names"
else
    export LDFLAGS="${COMMON_LDFLAGS}"
    export LINKFLAGS="${COMMON_LINKFLAGS}"
fi

export EIGEN_CFLAGS="-idirafter $CONDA_PREFIX/include/eigen3"

mkdir -p "$PREFIX/bin"
mkdir -p "$PREFIX/lib"
mkdir -p "$PREFIX/share"
./configure -conda && ./build && cp -r bin lib share "$PREFIX"

