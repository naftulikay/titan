# Titan Hub Module

module "network" {
  source = "../titan_network"

  domain = "${var.domain}"
  domain_name_servers = ["${var.domain_name_servers}"]
  instance_tenancy = "${var.instance_tenancy}"
  name = "${var.name}"
  name_fancy = "${var.name_fancy}"
  name_short = "${var.name_short}"
  netbios_name_servers = ["${var.netbios_name_servers}"]
  network_id = "${var.network_id}"
  ntp_servers = ["${var.ntp_servers}"]
  subnets_per_layer = "${var.subnets_per_layer}"
}
