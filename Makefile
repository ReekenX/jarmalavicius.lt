deploy:
	cd src && npm run build
	rsync -Pav src/_site/ 2gb:projects/www.jarmalavicius.lt/_site/
