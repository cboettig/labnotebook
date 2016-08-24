#!/bin/bash
cp ../../vita.md .
pandoc vita.md --template cv-template.tex -o cv.pdf
rm vita.md
