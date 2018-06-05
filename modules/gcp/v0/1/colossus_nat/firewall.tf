# Colossus NAT Module - Firewall Resources

resource "google_compute_firewall" "summary" {
  name = "nat-gateway-ingress"
  description = "Firewall rule allowing instances within the network to use NAT gateways as a summary route to WAN."

  network = "${var.vpc_id}"

  allow {
    protocol = "all"
  }

  # anybody within the network can send anything to NAT because internet
  source_ranges = ["${var.network_cidr_block}"]
  target_tags = ["${local.primary_instance_tag}"]
}

resource "google_compute_firewall" "health_check" {
  name    = "nat-gateway-health-check"
  description = "Firewall rule allowing health checks to NAT gateway instances."
  network = "${var.vpc_id}"

  allow {
    protocol = "tcp"
    ports    = ["${local.healthcheck_port}"]
  }

  # google helthcheck services can hit up the health check
  source_ranges = ["130.211.0.0/22", "35.191.0.0/16"]
  target_tags   = ["${local.primary_instance_tag}"]
}
