# Titan Layer Module - Outputs

output "layer_index" {
  value = "${var.layer_index}"
}

output "name" {
  value = "${var.name}"
}

output "network_cidr_block" {
  value = "${var.network_cidr_block}"
}

output "network_id" {
  value = "${var.network_id}"
}

output "network_name" {
  value = "${var.network_name}"
}

output "network_name_fancy" { value = "${var.network_name_fancy}" }

output "region" {
  value = "${var.region}"
}

output "vpc_id" { value = "${var.vpc_id}" }

output "zone" {
  value = "${var.zone}"
}
