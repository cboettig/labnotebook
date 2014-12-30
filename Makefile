
deploy:
	bash -c "source ../.notebook-env.sh"
	docker run --name labnotebook \
		-v $(PWD):/data \
		-w /data -d -P \
		-e TWIT_KEY -e TWIT_SECRET -e TWIT_TOK \
		-e TWIT_TOK_SECRET -e GIT_NAME -e GIT_EMAIL \
		-e GH_TOKEN -e GARB_KEY -e GARB_PASS -e GARB_UA \
		cboettig/labnotebook


bash:
	bash -c "source ../.notebook-env.sh"
	docker run -v $(PWD):/data \
		--rm -it \
		-w /data \
		-e TWIT_KEY -e TWIT_SECRET -e TWIT_TOK \
		-e TWIT_TOK_SECRET -e GIT_NAME -e GIT_EMAIL \
		-e GH_TOKEN -e GARB_KEY -e GARB_PASS -e GARB_UA \
		--entrypoint="/bin/bash" \
		cboettig/labnotebook -c bash
