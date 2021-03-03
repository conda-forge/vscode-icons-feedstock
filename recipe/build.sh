EXTENSION_PATH="./vscode-icons.vsix"
mkdir -p $PREFIX/etc/share/code-server/extensions
npm install
npm run build
npx vsce package --out ${EXTENSION_PATH}
code-server --install-extension ${EXTENSION_PATH} --extensions-dir $PREFIX/share/code-server/extensions
