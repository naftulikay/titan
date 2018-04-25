# Titan NAT Module - Variables

variable "additional_instance_labels" { default = {} }
variable "additional_instance_tags" { default = [] }
variable "additional_private_routing_tags" { default = [] }
variable "additional_ssh_cidr_blocks" { default = [] }
variable "additional_startup_script" { default = "" }
variable "allow_local_ssh_access" { default = "true" }
variable "autohealing_initial_delay" { default = "120" }
variable "dmz_cidr_blocks" { type = "list" }
variable "dmz_subnet_ids" { type = "list" }
variable "healthcheck_healthy_threshold" { default = "3" }
variable "healthcheck_interval" { default = "10" }
variable "healthcheck_path" { default = "/health-check" }
variable "healthcheck_port" { default = "8080" }
variable "healthcheck_timeout" { default = "5" }
variable "healthcheck_unhealthy_threshold" { default = "6" }
variable "instance_boot_disk_size" { default = "32" }
variable "instance_boot_disk_type" { default = "pd-standard" }
variable "instance_image" { default = "centos-cloud/centos-7" }
variable "instance_labels" { default = {} }
variable "instance_metadata" { default = {} }
variable "instance_service_account" { default = [] }
variable "instance_tags" { default = ["nat-gateway", "public", "titan-dmz"] }
variable "instance_type" { default = "n1-standard-2" }
variable "max_availability_zones" { default = "3" }
variable "network_cidr_block" {}
variable "network_id" {}
variable "private_route_priority" { default = "900" }
variable "private_routing_tags" { default = ["private", "nat"] }
variable "region" { default = "us-east1" }
variable "ssh_source_tags" { default = [] }
variable "startup_script_template" { default = "" }
variable "vpc_id" {}
