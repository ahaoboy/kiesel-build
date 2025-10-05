DOWNLOAD_URL="$1"
TARGET="$2"

FILE_NAME=$(basename "$DOWNLOAD_URL")
EXT="${FILE_NAME##*.}"

curl -L -o "${FILE_NAME}" "$DOWNLOAD_URL"

chmod +x "${FILE_NAME}"

mkdir -p dist

cp "${FILE_NAME}" "dist/kiesel${EXT}"

tar -czf ./kiesel-${TARGET}.tar.gz -C dist .
