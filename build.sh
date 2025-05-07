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


    # Copy the [de]activate scripts to $PREFIX/etc/conda/[de]activate.d.
    # This will allow them to be run on environment activation.
    for CHANGE in "activate" "deactivate"; do
        mkdir -p "${PREFIX}/etc/conda/${CHANGE}.d"
    done
    echo 'alias mrview="QT_XCB_GL_INTEGRATION= mrview"' > "${PREFIX}/etc/conda/activate.d/${PKG_NAME}_activate.sh"
    echo 'alias shview="QT_XCB_GL_INTEGRATION= shview"' >> "${PREFIX}/etc/conda/activate.d/${PKG_NAME}_activate.sh"
    echo 'unalias mrview shview' > "${PREFIX}/etc/conda/deactivate.d/${PKG_NAME}_deactivate.sh"
fi

export EIGEN_CFLAGS="-idirafter $CONDA_PREFIX/include/eigen3"

mkdir -p "$PREFIX/bin"
mkdir -p "$PREFIX/lib"
mkdir -p "$PREFIX/share"
./configure -conda && ./build && cp -r bin lib share "$PREFIX"

