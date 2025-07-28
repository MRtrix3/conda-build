#!/bin/bash

if [[ $# -lt 3 ]]; then
  echo usage: run.sh tag user suffix
else

  set -ex

  sed -e " s|TAGNAME|$1|g" -e "s|GIT_USER|$2|g" meta.yaml.in > meta.yaml

  # inject an extra build-variant pin for macOS
  cat >> conda_build_config.yaml <<'YAML'
cxx_compiler_version:
  - 16        # [osx]
c_stdlib:
  - sysroot         # [linux]
c_stdlib_version:   # [linux]
  - 2.17            # [linux]
YAML


  $CONDA/bin/conda config --env --add channels conda-forge

  "$CONDA"/bin/conda-build .
  pkgfile=$("$CONDA"/bin/conda-build . --output)
  cp $pkgfile $(basename $pkgfile)-$3

fi
