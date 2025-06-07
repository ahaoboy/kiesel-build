#!/bin/bash

if [ $# -ne 1 ]; then
    echo "not found target"
    exit 1
fi

TARGET=$1

git clone https://codeberg.org/kiesel-js/kiesel.git kiesel --depth=1
cd kiesel

zig build -Doptimize=ReleaseSafe

mkdir ../dist

cp ./zig-out/bin/kiesel ../kiesel

cd ..

ls -lh dist

tar -czf ./kiesel-${TARGET}.tar.gz -C dist .
ls -l ./kiesel-${TARGET}.tar.gz