# Titan NAT Module Template Variables File for Projects

variable "nat_additional_instance_labels" { default = {} }
variable "nat_additional_instance_tags" { default = [] }
variable "nat_additional_private_routing_tags" { default = [] }
variable "nat_additional_ssh_cidr_blocks" { default = [] }
variable "nat_additional_startup_script" { default = "" }
variable "nat_allow_local_ssh_access" { default = "true" }
variable "nat_autohealing_initial_delay" { default = "120" }
variable "nat_dmz_cidr_blocks" { type = "list" }
variable "nat_dmz_subnet_ids" { type = "list" }
variable "nat_healthcheck_healthy_threshold" { default = "3" }
variable "nat_healthcheck_interval" { default = "10" }
variable "nat_healthcheck_path" { default = "/health-check" }
variable "nat_healthcheck_port" { default = "8080" }
variable "nat_healthcheck_timeout" { default = "5" }
variable "nat_healthcheck_unhealthy_threshold" { default = "6" }
variable "nat_instance_boot_disk_size" { default = "32" }
variable "nat_instance_boot_disk_type" { default = "pd-standard" }
variable "nat_instance_image" { default = "centos-cloud/centos-7" }
variable "nat_instance_labels" { default = {} }
variable "nat_instance_metadata" { default = {} }
variable "nat_instance_service_account" { default = [] }
variable "nat_instance_tags" { default = ["nat-gateway", "public"] }
variable "nat_instance_type" { default = "n1-standard-2" }
variable "nat_max_availability_zones" { default = "3" }
variable "nat_network_cidr_block" {}
variable "nat_network_id" {}
variable "nat_private_route_priority" { default = "900" }
variable "nat_private_routing_tags" { default = ["private", "nat"] }
variable "nat_region" { default = "us-east1" }
variable "nat_ssh_source_tags" { default = [] }
variable "nat_startup_script_template" { default = "" }
variable "nat_vpc_id" {}
