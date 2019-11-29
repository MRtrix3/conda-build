#!/bin/bash

if [[ $# -ne 3 ]]; then
  echo usage: run.sh tag user prefix
else

  set -ex

  sed -i'.orig' -e " s|TAGNAME|$1|g" -e "s|GIT_USER|$2|g" meta.yaml

  "$CONDA"/bin/conda-build .

  pkgfile=$("$CONDA"/bin/conda-build . --output)
  mv $pkgfile $3-$(basename $pkgfile)

fi

