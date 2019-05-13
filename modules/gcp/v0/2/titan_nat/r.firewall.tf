# Titan NAT Module - Firewall Resources

resource "google_compute_firewall" "nat_ssh" {
  name = "nat-gateway-ssh"
  description = "Firewall rule allowing SSH access to NAT gateway instances."
  network = "${var.vpc_id}"

  direction = "INGRESS"

  allow {
    protocol = "tcp"
    ports = ["22"]
  }

  # allow access from (optionally) the local VPC, additional CIDR blocks, and source tags to NAT gateway instances
  source_ranges = ["${concat(list(local.allowed_ssh_network_block), var.additional_ssh_cidr_blocks)}"]
  source_tags = ["${var.ssh_source_tags}"]
  target_tags = ["${var.instance_tags[0]}"]
}

resource "google_compute_firewall" "nat_summary" {
  name = "nat-internal-ingress"
  description = "Firewall rule allowing instances within the network to use NAT gateways as a summary route to WAN."

  network = "${var.vpc_id}"

  allow {
    protocol = "all"
  }

  source_tags = ["${var.private_routing_tags}"]
  target_tags = ["${var.instance_tags[0]}"]
}

resource "google_compute_firewall" "health_check" {
  name    = "nat-gateway-health-check"
  description = "Firewall rule allowing health checks to NAT gateway instances."
  network = "${var.vpc_id}"

  allow {
    protocol = "tcp"
    ports    = ["${var.healthcheck_port}"]
  }

  source_ranges = ["130.211.0.0/22", "35.191.0.0/16"]
  target_tags   = ["${var.instance_tags[0]}"]
}
