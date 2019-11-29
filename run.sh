#!/bin/bash

if [[ $# -lt 3 ]]; then
  echo usage: run.sh tag user prefix [CONDA_ROOT]
else

  set -ex

  sed -i'.orig' -e " s|TAGNAME|$1|g" -e "s|GIT_USER|$2|g" meta.yaml

  [[ "x$4" != "x" ]] && CONDA="$4/bin/"
  ${CONDA}conda-build .

  pkgfile=$(${CONDA}conda-build . --output)
  mv $pkgfile $3-$(basename $pkgfile)

fi

