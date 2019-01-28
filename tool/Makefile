#!/usr/bin/make -f

SHELL:=$(shell which bash)

# default to terraform 0.11.11
TERRAFORM_VERSION=$(shell if [ -z "$$TERRAFORM_VERSION" ]; then echo "0.11.11" ; else echo "$$TERRAFORM_VERSION" ; fi)

export PATH=$(shell echo $$HOME)/.local/bin:$(shell echo $$PATH)

install-terraform:
	@if ! which terraform &>/dev/null ; then \
		mkdir -p ~/.local/bin ; \
		cd ~/.local/bin ; \
		tmp_archive="$$(mktemp --suffix .zip)" ; \
		wget -q -O "$$tmp_archive" https://releases.hashicorp.com/terraform/$${TERRAFORM_VERSION}/terraform_$${TERRAFORM_VERSION}_linux_amd64.zip ; \
		unzip "$$tmp_archive" ; \
		chmod 0755 ~/.local/bin/terraform ; \
		rm -f "$$tmp_archive" ; \
	fi
	@terraform -version

pip:
	@pip install -q $(shell test -z "$$TRAVIS" && echo "--user") -r requirements.txt

build: pip install-terraform
	@buildout
	@echo

unit-test: build
	@bin/test
	@echo

integration-test: build
	@bin/titan validate

test: unit-test integration-test
