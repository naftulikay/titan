# Colossus Network Module - NAT Resources

variable "nat_instance_type"           { default = "n1-standard-2" }
variable "nat_max_availability_zones"  { default = 5 }
variable "nat_zonal_high_availability" { default = false }

output "nat_public_ips" { value = ["${concat(module.nat.primary_public_ips, module.nat.secondary_public_ips)}"] }

module "nat" {
  source = "../colossus_nat"

  dmz_cidr_block = "${module.dmz_layer.cidr_block}"
  dmz_subnet_id = "${module.dmz_layer.subnet_id}"
  instance_type = "${var.nat_instance_type}"
  max_availability_zones = "${var.nat_max_availability_zones}"
  network_cidr_block = "${local.cidr_block}"
  network_name = "${var.name}"
  vpc_id = "${google_compute_network.default.self_link}"
  zonal_high_availability = "${var.nat_zonal_high_availability}"
}
