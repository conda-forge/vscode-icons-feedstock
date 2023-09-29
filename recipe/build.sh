#!/bin/bash

set -euxo pipefail

EXTENSION_PATH="./vscode-icons.vsix"

rm $PREFIX/bin/node
ln -s $BUILD_PREFIX/bin/node $PREFIX/bin/node

if [[ "${target_platform}" == "osx-arm64" ]]; then
    export npm_config_arch="arm64"
fi

# Don't use pre-built gyp packages
export npm_config_build_from_source=true
export NPM_CONFIG_USERCONFIG=/tmp/nonexistentrc

# Later install steps need a valid git repository
git init .
git config user.email "you@example.com"
git config user.name "Your Name"
git add .
git commit -m "Initial commit" --no-verify --no-gpg-sign

npm install
npm run build
npx vsce package --out ${EXTENSION_PATH}
code-server --install-extension ${EXTENSION_PATH}
