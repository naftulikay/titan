#!/usr/bin/make -f

export GOOGLE_PROJECT GOOGLE_REGION GOOGLE_APPLICATION_CREDENTIALS

init:
	@if [ -z "$$GOOGLE_PROJECT" -o -z "$$GOOGLE_REGION" -o -z "$$GOOGLE_APPLICATION_CREDENTIALS" ]; then \
		echo "ERROR: Please make sure that GOOGLE_PROJECT, GOOGLE_REGION, and GOOGLE_APPLICATION_CREDENTIALS are defined as environment variables." >&2 && exit 1 ; \
	fi
	@if ! terraform init &>/dev/null ; then \
		terraform init ; \
	fi

plan: init
	@terraform plan

apply: init
	@terraform apply -auto-approve

destroy: init
	@terraform destroy -force

refresh: init
	@terraform refresh

output: init
	@terraform output -json | jq -S '. | to_entries | map_values({(.key): (.value.value)}) | add'
