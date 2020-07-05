#!/usr/bin/env bash

PACKAGES_DIR="./packages"
for file in `find "${PACKAGES_DIR}" -type f`; do
	sort -o ${file} ${file}
done
