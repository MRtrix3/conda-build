#!/bin/bash

if [[ $# -lt 3 ]]; then
  echo usage: run.sh tag user suffix
else

  set -ex

  sed -e " s|TAGNAME|$1|g" -e "s|GIT_USER|$2|g" meta.yaml.in > meta.yaml

  "$CONDA"/bin/conda-build .
  pkgfile=$("$CONDA"/bin/conda-build . --output)
  cp $pkgfile $(basename $pkgfile)-$3

fi

