#!/bin/bash
cp ../../vita.md .
pandoc vita.md --template cv-template.tex -o vita.pdf
rm vita.md
