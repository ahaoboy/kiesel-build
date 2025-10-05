DOWNLOAD_URL="$1"
TARGET="$2"

FILE_NAME=$(basename "$DOWNLOAD_URL")

if [[ "$FILE_NAME" == *.* ]]; then
  EXT=".${FILE_NAME##*.}"
else
  EXT=""
fi

DIST="dist-${TARGET}"

curl -L -o "${FILE_NAME}" "$DOWNLOAD_URL"

chmod +x "${FILE_NAME}"

mkdir -p $DIST

cp "${FILE_NAME}" "$DIST/kiesel${EXT}"

tar -czf ./kiesel-${TARGET}.tar.gz -C $DIST .
