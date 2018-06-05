# Colossus NAT Module - IP Address Resources

output "primary_private_ips"      { value = ["${google_compute_address.private_primary.*.address}"] }
output "primary_private_ip_ids"   { value = ["${google_compute_address.private_primary.*.self_link}"] }
output "primary_public_ips"       { value = ["${google_compute_address.public_primary.*.address}"] }
output "primary_public_ip_ids"    { value = ["${google_compute_address.public_primary.*.self_link}"] }
output "secondary_private_ips"    { value = ["${google_compute_address.private_primary.*.address}"] }
output "secondary_private_ip_ids" { value = ["${google_compute_address.private_primary.*.self_link}"] }
output "secondary_public_ips"     { value = ["${google_compute_address.public_secondary.*.address}"] }
output "secondary_public_ip_ids"  { value = ["${google_compute_address.public_secondary.*.self_link}"] }

resource "google_compute_address" "private_primary" {
  count = "${length(local.availability_zones)}"

  name = "nat-0-${element(split("-", local.availability_zones[count.index]), 2)}-private"
  address_type = "INTERNAL"
  subnetwork = "${var.dmz_subnet_id}"
  address = "${cidrhost(var.dmz_cidr_block, (count.index * 256) + 2)}"
}

resource "google_compute_address" "private_secondary" {
  count = "${var.zonal_high_availability ? length(local.availability_zones) : 0}"

  name = "nat-1-${element(split("-", local.availability_zones[count.index]), 2)}-private"
  address_type = "INTERNAL"
  subnetwork = "${var.dmz_subnet_id}"
  address = "${cidrhost(var.dmz_cidr_block, (count.index * 256) + 3)}"
}

resource "google_compute_address" "public_primary" {
  count = "${length(local.availability_zones)}"

  name = "nat-0-${element(split("-", local.availability_zones[count.index]), 2)}-public"
  address_type = "EXTERNAL"
}

resource "google_compute_address" "public_secondary" {
  count = "${var.zonal_high_availability ? length(local.availability_zones) : 0}"

  name = "nat-1-${element(split("-", local.availability_zones[count.index]), 2)}-public"
  address_type = "EXTERNAL"
}
