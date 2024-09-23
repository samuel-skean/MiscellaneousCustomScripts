#!/usr/bin/env python3

# Pass the number of pages as the first argument, and you're good.
# Generates pages that are the correct size for Grechanik's CS 441 slides.
from reportlab.lib.pagesizes import inch
from reportlab.pdfgen import canvas
import sys


if len(sys.argv) != 2:
    print("Give me exactly one argument: the number of pages to generate.")
    exit(1)

# Define your custom dimensions
width, height = 10 * inch, 7.5 * inch

# Create a new PDF file
pdf_file = "empty.pdf"
c = canvas.Canvas(pdf_file, pagesize=(width, height))

# Add Pages
for i in range(0, int(sys.argv[1])):
    c.showPage()
# Save the PDF
c.save()