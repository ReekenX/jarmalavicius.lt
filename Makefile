.SILENT: deploy

deploy:
	echo "<<< Making config backup"
	cp src/_config.yml src/_config.yml.bak
	
	echo "<<< Dropping .html suffix from URLs"
	sed -i '' 's/:output_ext//g' src/_config.yml
	
	echo "<<< Building _site"
	cd src && npm run build 2>&1 > /dev/null
	
	echo "<<< Syncing files to remote"
	rsync -Pa src/_site/ 2gb:projects/www.jarmalavicius.lt/_site/ 2>&1 > /dev/null
	
	echo "<<< Restoring config file"
	@mv src/_config.yml.bak src/_config.yml
