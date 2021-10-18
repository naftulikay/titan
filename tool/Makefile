#!/usr/bin/make -f

SHELL:=$(shell which bash)

TERRAFORM_VERSION:=1.0.9

.PHONY: install-terraform-impl install-terraform install-venv-impl install-venv venv-impl venv install-buildout-impl \
	install-buildout buildout-impl buildout test-impl test validate-impl validate

# determine if we're running in a terminal
TTY:=$(shell [ -t ] && echo y || echo n)

ifeq ($(TTY),y)
TERM_GREEN=\e[1;32m
TERM_RED=\e[1;31m
TERM_YELLOW=\e[1;33m
TERM_CYAN=\e[1;36m
TERM_RESET=\e[0m
else
TERM_GREEN:=
TERM_RED:=
TERM_YELLOW:=
TERM_CYAN:=
TERM_RESET:=
endif

ECHO:=$(shell which echo) -e

# install terraform
install-terraform-impl:
	@if [ ! -e ~/.local/share/terraform/$(TERRAFORM_VERSION)/terraform ]; then \
  		$(ECHO) '$(TERM_CYAN)INFO: Installing Terraform CLI.$(TERM_RESET)' ; \
  		TERRAFORM_TMP_DIR=$$(mktemp -d) && \
  		pushd "$${TERRAFORM_TMP_DIR}" && \
  		wget -q -O "terraform.zip" https://releases.hashicorp.com/terraform/$(TERRAFORM_VERSION)/terraform_$(TERRAFORM_VERSION)_linux_amd64.zip || \
  			($(ECHO) '$(TERM_RED)ERROR: Unable to download Terraform.$(TERM_RESET)' && exit 1) && \
  		unzip "terraform.zip" || \
  			($(ECHO) '$(TERM_RED)ERROR: Unable to unzip Terraform archive.$(TERM_RESET)' && exit 1) && \
  		mkdir -p ~/.local/share/terraform/$(TERRAFORM_VERSION) && \
  		install -m 0755 ./terraform ~/.local/share/terraform/$(TERRAFORM_VERSION)/ && \
  		popd && \
  		rm -r "$${TERRAFORM_TMP_DIR}" ; \
  		$(ECHO) '$(TERM_GREEN)SUCCESS: Downloaded Terraform $(TERRAFORM_VERSION) CLI.$(TERM_RESET)' ; \
  	  fi
	@if [ ! -h ~/.local/share/terraform/current ] || \
			[ "$$(readlink ~/.local/share/terraform/current)" != "$$(echo ~/.local/share/terraform/1.0.9)" ]; then \
  		rm -f ~/.local/share/terraform/current ; \
  		ln -s ~/.local/share/terraform/$(TERRAFORM_VERSION) ~/.local/share/terraform/current || \
  			($(ECHO) '$(TERM_RED)ERROR: Unable to install Terraform symlink.$(TERM_RESET)' && exit 1) && \
  		$(ECHO) '$(TERM_GREEN)SUCCESS: Installed ~/.local/share/terraform/current symlink.' ; \
	fi
	@if [ ! -h ~/.local/bin/terraform ] || \
			[ "$$(readlink ~/.local/bin/terraform)" != "$$(echo ~/.local/share/terraform/current/terraform)" ] ; then \
		$(ECHO) '$(TERM_CYAN)INFO: Setting up Terraform CLI symlink.$(TERM_RESET)' ; \
		mkdir -p ~/.local/bin ; \
		rm -f ~/.local/bin/terraform ; \
		ln -s ~/.local/share/terraform/current/terraform ~/.local/bin/terraform ; \
	fi
	@$(ECHO) '$(TERM_GREEN)SUCCESS: Installed Terraform $(TERRAFORM_VERSION).$(TERM_RESET)'

install-terraform: install-terraform-impl

# install virtualenv from pypi
install-venv-impl:
	@$(ECHO) '$(TERM_CYAN)INFO: Installing virtualenv.$(TERM_RESET)'
	@pip install virtualenv || \
		($(ECHO) '$(TERM_RED)ERROR: Failed to install virtualenv.$(TERM_RESET)' && exit 1)
	@$(ECHO) '$(TERM_GREEN)SUCCESS: Installed virtualenv.$(TERM_RESET)'

install-venv: install-venv-impl

# create the virtual environment
venv-impl:
	@$(ECHO) '$(TERM_CYAN)INFO: Creating virtualenv.$(TERM_RESET)'
	@virtualenv venv/ || \
		($(ECHO) '$(TERM_RED)ERROR: Unable to create virtualenv.$(TERM_RESET)' && exit 1)
	@$(ECHO) '$(TERM_GREEN)SUCCESS: Created virtualenv.$(TERM_RESET)'

venv: install-venv venv-impl

# install buildout with pip
install-buildout-impl:
	@$(ECHO) '$(TERM_CYAN)INFO: Installing buildout.$(TERM_RESET)'
	@(source venv/bin/activate && pip install zc.buildout) || \
		($(ECHO) '$(TERM_RED)ERROR: Unable to install buildout.$(TERM_RESET)' && exit 1)
	@$(ECHO) '$(TERM_GREEN)SUCCESS: Installed buildout.$(TERM_RESET)'

install-buildout: venv install-buildout-impl

# execute buildout
buildout-impl:
	@$(ECHO) '$(TERM_CYAN)INFO: Executing buildout.$(TERM_RESET)'
	@(source venv/bin/activate && buildout ) || \
		($(ECHO) '$(TERM_RED)ERROR: Unable to run buildout.$(TERM_RESET)' && exit 1)
	@$(ECHO) '$(TERM_GREEN)SUCCESS: Executed buildout.$(TERM_RESET)'

buildout: install-venv venv install-buildout buildout-impl

# run unit tests
test-impl:
	@$(ECHO) '$(TERM_CYAN)INFO: Running unit tests.$(TERM_RESET)'
	@(source venv/bin/activate && bin/test -v) || \
		($(ECHO) '$(TERM_RED)ERROR: Tests failed.$(TERM_RESET)' && exit 1)
	@$(ECHO) '$(TERM_GREEN)SUCCESS: All unit tests passed.$(TERM_RESET)'

test: install-venv venv install-buildout buildout test-impl

# run validator
validate-impl:
	@if [ -z "$$AWS_ACCESS_KEY_ID" ]; then \
  		$(ECHO) '$(TERM_RED)ERROR: No AWS credentials found, unable to validate.$(TERM_RESET)' ; \
  		exit 1 ; \
  	fi
	@$(ECHO) '$(TERM_CYAN)INFO: Running Titan validation.$(TERM_RESET)'
	@(source venv/bin/activate && bin/titan validate) || \
		($(ECHO) '$(TERM_RED)ERROR: Titan validation failed.$(TERM_RESET)' && exit 1)
	@$(ECHO) '$(TERM_GREEN)SUCCESS: Titan validation successful.$(TERM_RESET)'

validate: install-venv venv install-buildout buildout install-terraform validate-impl