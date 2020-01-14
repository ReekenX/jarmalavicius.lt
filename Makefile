.SILENT: deploy

deploy:
	echo "<<< Building _site"
	cd src && npm run build 2>&1 > /dev/null
	
	echo "<<< Syncing files to remote"
	rsync -Pa --delete src/_site/ 2gb:projects/www.jarmalavicius.lt/_site/ 2>&1 > /dev/null
