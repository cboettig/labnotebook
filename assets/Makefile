
bib:
	bibtool -s -d -x citations.aux ~/Documents/Mendeley/bib/*.bib > citations.bib

teaching:
	pandoc --biblio citations.bib --template=template.md teaching.txt -o ../teaching.md
