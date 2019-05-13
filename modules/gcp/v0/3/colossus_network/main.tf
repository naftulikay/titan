# Colossus Network Module

data "google_client_config" "default" {}

locals {
  actual_public_route_tags = ["${concat(var.public_route_tags, var.addtl_public_route_tags)}"]
  cidr_block = "${cidrsubnet("10.0.0.0/8", 7, var.id)}"
  public_route_name = "public"
  public_zone_description = "Public Hosted Zone for the Colossus ${var.name_fancy} Network."
  public_zone_name = "public"
  vpc_description = "Colossus ${var.name_fancy} Network"
  vpc_name = "colossus-network-${var.name_short}"
  zone = "${var.name_short}.${var.domain}"
}

variable "addtl_public_route_tags" { default = [] }
variable "depends_on" { type = "list" default = [] }
variable "domain" {}
variable "id" {}
variable "name" {}
variable "name_fancy" {}
variable "name_short" {}
variable "public_route_priority" { default = "900" }
variable "public_route_tags" { type = "list" default = ["colossus-dmz", "public"] }
variable "enable_flow_logs" { default = false }

output "cidr_block" { value = "${local.cidr_block}" }
output "default_gateway_ipv4" { value = "${google_compute_network.default.gateway_ipv4}" }
output "id" { value = "${var.id}" }
output "name" { value = "${var.name}" }
output "name_fancy" { value = "${var.name_fancy}" }
output "name_short" { value = "${var.name_short}" }
output "public_route_name" { value = "${local.public_route_name}" }
output "public_route_id" { value = "${google_compute_route.public.self_link}" }
output "public_route_priority" { value = "${var.public_route_priority}" }
output "public_route_tags" { value = ["${local.actual_public_route_tags}"] }
output "public_zone_id" { value = "${google_dns_managed_zone.public.id}" }
output "public_zone_name" { value = "${local.public_zone_name}" }
output "public_zone_nameservers" { value = ["${google_dns_managed_zone.public.name_servers}"] }
output "region" { value = "${data.google_client_config.default.region}" }
output "uninitialized_space" { value = "${cidrsubnet(local.cidr_block, 4, 15)}" }
output "vpc_id" { value = "${google_compute_network.default.self_link}" }
output "vpc_name" { value = "${local.vpc_name}" }
output "zone" { value = "${local.zone}" }

# resources
resource "google_compute_network" "default" {
  name = "${local.vpc_name}"
  description = "${local.vpc_description}"
  auto_create_subnetworks = false
  routing_mode = "REGIONAL"
}

resource "google_dns_managed_zone" "public" {
  name = "${local.public_zone_name}"
  dns_name = "${local.zone}."
  description = "${local.public_zone_description}"
  visibility = "public"
}

resource "google_compute_route" "public" {
  name = "${local.public_route_name}"
  dest_range = "0.0.0.0/0"
  network = "${google_compute_network.default.self_link}"
  next_hop_gateway = "default-internet-gateway"
  priority = "${var.public_route_priority}"
  tags = ["${local.actual_public_route_tags}"]
}
