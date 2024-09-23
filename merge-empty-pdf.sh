#!/usr/bin/env bash
source ~/bin/.venv/bin/activate
generate-empty-pdf.py $1
pdftk A=$2 B=empty.pdf shuffle A Bend-1 output merged.pdf
rm empty.pdf