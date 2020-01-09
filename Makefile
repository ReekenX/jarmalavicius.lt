deploy:
	sed 's/:output_ext//g' src/_config.yml
	cd src && npm run build
	rsync -Pav src/_site/ 2gb:projects/www.jarmalavicius.lt/_site/
