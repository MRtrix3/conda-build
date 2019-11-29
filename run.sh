#!/bin/bash

# usage: run.sh tag user/repo prefix

set -e

sed -i 's|TAGNAME|$1|g' meta.yaml
sed -i 's|GIT_REPO|$2|g' meta.yaml

[[ "x$CONDA" == "x" ]] || CONDA="$CONDA/bin/"
${CONDA}conda-build .

pkgfile=$(${CONDA}conda-build . --output)
mv $pkgfile $3-$pkgfile

