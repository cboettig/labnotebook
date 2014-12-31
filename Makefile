## be sure to do `source ../.notebook-env.sh` fist
## Cannot run this in makefile since it doesn't understand 'source'
## Cannot run with bash -c "source ../.notebook-env.sh" since then it's not available to the parent shell
build:
	docker run --name labnotebook \
		-v $(PWD):/data \
		-w /data -d -P \
		-e TWIT_KEY -e TWIT_SECRET -e TWIT_TOK \
		-e TWIT_TOK_SECRET -e GIT_NAME -e GIT_EMAIL \
		-e GH_TOKEN -e GARB_KEY -e GARB_PASS -e GARB_UA \
		cboettig/labnotebook

deploy:
	git clone -b gh-pages git@github.com/cboettig/labnotebook.git _gh-pages
	rsync -a _site/ _gh-pages/
#	cd _gh-pages && git add --all . && git commit -m 'Site updated' && git push


bash:
	docker run -v $(PWD):/data \
		--rm -it \
		-w /data \
		-e TWIT_KEY -e TWIT_SECRET -e TWIT_TOK \
		-e TWIT_TOK_SECRET -e GIT_NAME -e GIT_EMAIL \
		-e GH_TOKEN -e GARB_KEY -e GARB_PASS -e GARB_UA \
		--entrypoint="/bin/bash" \
		cboettig/labnotebook -c bash
