EXTENSIONS_DIR="${PREFIX}/share/code-server/extensions"
PACKAGE_PATH="./vscode-icons.vsix"

npm install
npm run build
npx vsce package --out "${PACKAGE_PATH}"

mkdir -p "${EXTENSIONS_DIR}"
code-server \
    --install-extension "${PACKAGE_PATH}"
    --extensions-dir "${EXTENSIONS_DIR}"
