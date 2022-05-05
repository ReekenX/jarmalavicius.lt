SHELL = /bin/bash
GREEN = `tput setaf 2`
RESET = `tput sgr0`

help: # see help (this view)
	@echo "Available commands:"
	@echo
	@grep '^[a-z\/]*:' Makefile | awk -F:\  '{sub(/# /, "–> ", $$2); printf("%20s %s\n", $$1, $$2)}' | grep '–'

install: # install Jekyll and plugins
	@echo "$(GREEN)>>> Installing Jekyll and packages$(RESET)"
	@bundle install
	@echo "$(GREEN)>>> Installing Node packages$(RESET)"
	@npm install

run: # boot project with Jekyll local with livereload mode
	@echo "$(GREEN)>>> Booting Jekyll with live reload mode$(RESET)"
	@bundle exec jekyll serve --host 0.0.0.0 --drafts
