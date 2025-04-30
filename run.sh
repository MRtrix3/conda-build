#!/bin/bash

if [[ $# -ne 3 ]]; then
  echo usage: run.sh tag user prefix
else

  set -ex

  sed -e " s|TAGNAME|$1|g" -e "s|GIT_USER|$2|g" meta.yaml.in > meta.yaml

  pkgfile=$("$CONDA"/bin/conda-build . --output-folder ./build)

fi

