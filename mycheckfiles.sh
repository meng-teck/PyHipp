#!/bin/bash

for d in 20180??? 201810??; do
    if [ -d "$d" ]; then
        count=$(find "$d" -type f -name "*.hkl" | grep -v -e spiketrain -e mountains | wc -l)
        echo "$d: number of hkl files"
        echo "$count"
    fi
done
