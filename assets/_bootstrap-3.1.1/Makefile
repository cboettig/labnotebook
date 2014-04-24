
all: 
	make css
	make deploy-css
	make deploy-js
	make deploy-fonts
	make clean

deploy-css: dist/css/bootstrap.min.css
	cp dist/css/bootstrap.min.css ../css/

deploy-js: dist/js/bootstrap.min.js
	cp dist/js/bootstrap.min.js ../js/

deploy-fonts:
	cp -r dist/fonts ..

css: less/bootstrap.less
	grunt dist
	
clean:
	rm -rf docs/ dist/
