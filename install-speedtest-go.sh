#!/usr/bin/env bash
# Automated installer for speedtest-go on Linux (x86_64 / arm64)
set -euo pipefail

VERSION="1.7.10"
REPO="showwin/speedtest-go"

echo "==> Detecting system architecture..."
ARCH_RAW="$(uname -m)"
case "$ARCH_RAW" in
    x86_64) ARCH="x86_64" ;;
    aarch64|arm64) ARCH="arm64" ;;
    *) echo "Unsupported architecture: $ARCH_RAW"; exit 1 ;;
esac
echo "    Architecture: $ARCH_RAW -> $ARCH"

FILE="speedtest-go_${VERSION}_Linux_${ARCH}.tar.gz"
URL="https://github.com/${REPO}/releases/download/v${VERSION}/${FILE}"

TMPDIR="$(mktemp -d)"
cd "$TMPDIR"

echo "==> Downloading $FILE ..."
wget -q --show-progress "$URL"

echo "==> Extracting archive..."
tar -xzf "$FILE"

if [ ! -f "speedtest-go" ]; then
    echo "Error: speedtest-go binary not found after extraction."
    ls -la
    exit 1
fi

echo "==> Installing to /usr/local/bin ..."
sudo mv speedtest-go /usr/local/bin/speedtest-go
sudo chmod +x /usr/local/bin/speedtest-go

echo "==> Cleaning up temporary files..."
cd /
rm -rf "$TMPDIR"

echo "==> Installation complete. Installed version:"
speedtest-go --version

echo ""
echo "Run a speed test with: speedtest-go -m"
