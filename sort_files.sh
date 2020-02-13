#!/usr/bin/env bash

files=( codecs fonts software/common software/laptop software/desktop )

for f in "${files[@]}"; do
	sort -o $f $f
done
