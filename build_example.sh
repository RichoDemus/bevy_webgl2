#!/bin/bash
set -eo pipefail

export EXAMPLE=$1
RELEASE=${2:-release}
if [ $RELEASE == "release" ]; then
   RELEASE_OPTS="--release"
fi
OUT_DIR=bevy-showcase
mkdir -p ${OUT_DIR}/wasm
cp -a assets/ ${OUT_DIR}
cp -a index.html ${OUT_DIR}
cargo build  $RELEASE_OPTS --example $EXAMPLE --target wasm32-unknown-unknown 
wasm-bindgen --no-typescript --out-dir ${OUT_DIR}/wasm --out-name $EXAMPLE --target web target/wasm32-unknown-unknown/$RELEASE/examples/${EXAMPLE}.wasm
echo
echo http://127.0.0.1:4000/index.html?example=${EXAMPLE}
#echo
test -z "$SKIP_HTTP_SERVER" && basic-http-server -x $OUT_DIR
