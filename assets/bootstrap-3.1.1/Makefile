
all: 
	make css
	make deploy-css
	make clean

deploy-css: dist/css/bootstrap.min.css
	cp dist/css/bootstrap.min.css ../css/

css: less/bootstrap.less
	grunt dist
	
clean:
	rm -rf docs/ dist/
