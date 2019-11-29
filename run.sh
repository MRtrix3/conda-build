#!/bin/bash

if [[ $# -ne 3 ]]; then
  echo usage: run.sh tag user prefix
else

  set -e

  sed -i'.orig' -e " s|TAGNAME|$1|g" -e "s|GIT_USER|$2|g" meta.yaml

  [[ "x$CONDA" == "x" ]] || CONDA="$CONDA/bin/"
  ${CONDA}conda-build .

  pkgfile=$(${CONDA}conda-build . --output)
  mv $pkgfile $3-$(basename $pkgfile)

fi

