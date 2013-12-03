
all:
	make sync
	make jekyll 
	make publish

## Make sure github hosting repo is up-to-date before we write to it
sync: 
	cd ~/Documents/code/cboettig.github.com  
	git pull -s ours
	cd - 

## Compile the site onto cboettig.github.om 
jekyll: 
	jekyll build -d ~/Documents/code/cboettig.github.com  


## Upload to github
publish: 
	cd ~/Documents/code/cboettig.github.com  
	git add *
	git commit -a -m "update site"
	git push
	echo "Site updated on Github server"


clean:
	rm -f *_library.json gitdata.json
