#!/bin/bash

PACKAGE_NAME=$(node -p -e "require('./package.json').name")
PACKAGE_VERSION=$(node -p -e "require('./package.json').version")

OUT_INDEX='./platforms/click'
OUT_MANIFEST='./platforms/click/manifest.json'

echo "[...] generate .click: $PACKAGE_NAME-$PACKAGE_VERSION"

echo "[...] write manifest version"
sed -i "s/\"version\": \"[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*\"/\"version\": \"$PACKAGE_VERSION\"/" $OUT_MANIFEST

echo "[...] write click"
click build $OUT_INDEX $OUT_INDEX
