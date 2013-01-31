#!/bin/bash


for f in grep -l '## References$' *.markdown *.md 
  # *md *.markdown 
  do 
    sed -n '/---/,/---/p' $f > yaml.md
    sed  '1,/^$/d' $f > body.md
    ~/.cabal/bin/./pandoc -f markdown body.md -t html -o body.html
    ~/.cabal/bin/./pandoc body.html -t markdown_github -o out.md
    cat yaml.md out.md > $f
    rm yaml.md body.md out.md body.html 
done


