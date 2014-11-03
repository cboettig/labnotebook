
deploy:
	docker run -v $(PWD):/labnotebook \
		-e TWIT_KEY -e TWIT_SECRET -e TWIT_TOK \
		-e TWIT_TOK_SECRET -e GIT_NAME -e GIT_EMAIL \
		-e GH_TOKEN -e GARB_KEY -e GARB_PASS -e GARB_UA \
		labnotebook 
