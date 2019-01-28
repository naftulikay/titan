#!/usr/bin/make -f

SHELL:=$(shell which bash)

.PHONY: all docs

pip:
	@pip install -q $(shell test -z  "$$TRAVIS" && echo "--user") -r requirements.txt

docs:
	@make -C docs/ html

serve: pip
	@sphinx-reload --host 0.0.0.0 --port 5500 docs/

test: pip
	@make -C tool test
