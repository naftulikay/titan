#!/usr/bin/make -f

init:
	@if ! terraform init &>/dev/null ; then \
		terraform init ; \
	fi

plan: init
	@terraform plan -var project_name=$$PROJECT_NAME

apply: init
	@terraform apply -auto-approve -var project_name=$$PROJECT_NAME

destroy: init
	@terraform destroy -force -var project_name=$$PROJECT_NAME

refresh: init
	@terraform refresh -var project_name=$$PROJECT_NAME

output: init
	@terraform output -json | jq -S '. | to_entries | map_values({(.key): (.value.value)}) | add'
