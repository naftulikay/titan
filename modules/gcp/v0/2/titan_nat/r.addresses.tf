# Titan NAT Module - IP Address Resources

resource "google_compute_address" "primary_external" {
  count = "${length(local.availability_zones)}"

  name = "nat-0-${element(split("-", local.availability_zones[count.index]), 2)}-external"
  address_type = "EXTERNAL"
}

resource "google_compute_address" "primary_internal" {
  count = "${length(local.availability_zones)}"
  
  name = "nat-0-${element(split("-", local.availability_zones[count.index]), 2)}-internal"
  address_type = "INTERNAL"
  subnetwork = "${var.dmz_subnet_ids[count.index % length(var.dmz_subnet_ids)]}"
  # for 10.1/16, 10.1.0.2, 10.1.1.2, 10.1.2.2, etc.
  address = "${cidrhost("${var.dmz_cidr_blocks[count.index]}", 2)}"
}
