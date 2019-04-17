# Colossus Layer Module

locals {
  # essentially 10.0.0.0/19, 10.0.32.0/19, 10.0.64.0/19
  cidr_block           = "${cidrsubnet(var.network_cidr_block, 4, (var.index * 3) + 0)}"
  container_cidr_block = "${cidrsubnet(var.network_cidr_block, 4, (var.index * 3) + 1)}"
  container_range_name = "${var.name}-container"
  services_cidr_block  = "${cidrsubnet(var.network_cidr_block, 4, (var.index * 3) + 2)}"
  services_range_name  = "${var.name}-services"
  subnet_description   = "${var.name_fancy} Layer Subnet in the Colossus ${var.network_name_fancy} Network."
}

# variables
variable "index" {}
variable "name" {}
variable "name_fancy" {}
variable "network_cidr_block" {}
variable "network_name_fancy" {}
variable "region" {}
variable "vpc_id" {}
variable "enable_flow_logs" { default = false }

# outputs
output "cidr_block" { value = "${local.cidr_block}" }
output "container_cidr_block" { value = "${local.container_cidr_block}" }
output "container_range_name" { value = "${local.container_range_name}" }
output "gateway_address" { value = "${google_compute_subnetwork.default.gateway_address}" }
output "index" { value = "${var.index}" }
output "services_cidr_block" { value = "${local.services_cidr_block}" }
output "services_range_name" { value = "${local.services_range_name}" }
output "name" { value = "${var.name}" }
output "name_fancy" { value = "${var.name_fancy}" }
output "region" { value = "${var.region}" }
output "subnet_id" { value = "${google_compute_subnetwork.default.self_link}" }

# resources
resource "google_compute_subnetwork" "default" {
  name = "${var.name}"
  description = "${local.subnet_description}"
  network = "${var.vpc_id}"
  private_ip_google_access = true
  region = "${var.region}"

  ip_cidr_range = "${local.cidr_block}"
  enable_flow_logs = "${var.enable_flow_logs}"

  # container range
  secondary_ip_range {
    range_name = "${local.container_range_name}"
    ip_cidr_range = "${local.container_cidr_block}"
  }

  # services range (GKE)
  secondary_ip_range {
    range_name = "${local.services_range_name}"
    ip_cidr_range = "${local.services_cidr_block}"
  }
}
