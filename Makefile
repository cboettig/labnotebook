## be sure to do `source ../.notebook-env.sh` fist
## Cannot run this in makefile since it doesn't understand 'source'
## Cannot run with bash -c "source ../.notebook-env.sh" since then it's not available to the parent shell

build:
	docker run \
		-v $(PWD):/data \
		-w /data --rm \
		-e TWIT_KEY -e TWIT_SECRET -e TWIT_TOK \
		-e TWIT_TOK_SECRET -e GIT_NAME -e GIT_EMAIL \
		-e GH_TOKEN -e GARB_KEY -e GARB_PASS -e GARB_UA \
		cboettig/labnotebook

deploy:
	./deploy.sh	

bash:
	docker run -v $(PWD):/data \
		--rm -it \
		-w /data \
		-e TWIT_KEY -e TWIT_SECRET -e TWIT_TOK \
		-e TWIT_TOK_SECRET -e GIT_NAME -e GIT_EMAIL \
		-e GH_TOKEN -e GARB_KEY -e GARB_PASS -e GARB_UA \
		--entrypoint="/bin/bash" \
		cboettig/labnotebook -c bash
