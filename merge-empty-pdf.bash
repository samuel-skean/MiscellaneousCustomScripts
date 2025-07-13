#!/usr/bin/env bash

echo "TODO: make this script invoke things based on paths relative to the location of this script." >&2

source ~/scripts/.venv/bin/activate
~/scripts/generate-empty-pdf.py $1
pdftk A=$2 B=empty.pdf shuffle A Bend-1 output merged.pdf
rm empty.pdf
