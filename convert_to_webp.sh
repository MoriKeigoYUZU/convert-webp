#!/bin/bash

find . -type f \( -iname \*.jpg -o -iname \*.jpeg -o -iname \*.png \) -exec sh -c 'magick "$1" "${1%.*}.webp"' _ {} \; -exec rm '{}' \;
