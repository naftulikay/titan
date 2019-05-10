# Titan NAT Module - Outputs

# locals
output "availability_zones" { value = ["${local.availability_zones}"] }
output "joined_instance_labels" { value = "${local.instance_labels}" }
output "joined_instance_metadata" { value = "${local.instance_metadata}" }
output "joined_instance_tags" { value = "${local.instance_tags}" }
output "startup_script" { value = "${local.startup_script}" }
output "startup_script_template_actual" { value = "${local.startup_script_template}" }

# variables
output "additional_instance_labels" { value = "${var.additional_instance_labels}" }
output "additional_instance_tags" { value = ["${var.additional_instance_tags}"] }
output "additional_ssh_cidr_blocks" { value = ["${var.additional_ssh_cidr_blocks}"] }
output "additional_startup_script" { value = "${var.additional_startup_script}" }
output "allow_local_ssh_access" { value = "${var.allow_local_ssh_access}" }
output "autohealing_initial_delay" { value = "${var.autohealing_initial_delay}" }
output "dmz_cidr_blocks" { value = ["${var.dmz_cidr_blocks}"] }
output "dmz_subnet_ids" { value = ["${var.dmz_subnet_ids}"] }
output "healthcheck_healthy_threshold" { value = "${var.healthcheck_healthy_threshold}" }
output "healthcheck_interval" { value = "${var.healthcheck_interval}" }
output "healthcheck_path" { value = "${var.healthcheck_path}" }
output "healthcheck_port" { value = "${var.healthcheck_port}" }
output "healthcheck_timeout" { value = "${var.healthcheck_timeout}" }
output "healthcheck_unhealthy_threshold" { value = "${var.healthcheck_unhealthy_threshold}" }
output "instance_boot_disk_size" { value = "${var.instance_boot_disk_size}" }
output "instance_boot_disk_type" { value = "${var.instance_boot_disk_type}" }
output "instance_image" { value = "${var.instance_image}" }
output "instance_labels" { value = "${var.instance_labels}" }
output "instance_metadata" { value = "${var.instance_metadata}" }
output "instance_service_account" { value = ["${var.instance_service_account}"] }
output "instance_tags" { value = "${var.instance_tags}" }
output "instance_type" { value = "${var.instance_type}" }
output "max_availability_zones" { value = "${var.max_availability_zones}" }
output "network_cidr_block" { value = "${var.network_cidr_block}" }
output "network_id" { value = "${var.network_id}" }
output "region" { value = "${var.region}" }
output "ssh_source_tags" { value = ["${var.ssh_source_tags}"] }
output "startup_script_template" { value = "${var.startup_script_template}" }
output "vpc_id" { value = "${var.vpc_id}" }
