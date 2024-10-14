#!/usr/bin/env bash
source ~/scripts/.venv/bin/activate
~/scripts/generate-empty-pdf.py $1
pdftk A=$2 B=empty.pdf shuffle A Bend-1 output merged.pdf
rm empty.pdf
