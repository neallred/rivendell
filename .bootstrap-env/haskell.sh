#!/bin/bash

if command -v stack >/dev/null 2>&1; then
  echo "haskell stack installed, upgrading..."

  stack upgrade
else
  curl -sSL https://get.haskellstack.org/ | sh
fi

pushd ~/

stack install \
  hindent \
  hlint

popd
