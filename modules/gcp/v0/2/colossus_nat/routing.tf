# Colossus NAT Module - Routing Resources

output "primary_regional_route_ids"   { value = ["${google_compute_route.primary_regional.*.self_link}"] }
output "secondary_regional_route_ids" { value = ["${google_compute_route.secondary_regional.*.self_link}"] }

resource "google_compute_route" "primary_regional" {
  count = "${length(local.availability_zones)}"

  name = "nat-0-${element(split("-", local.availability_zones[count.index]), 2)}-regional"
  dest_range = "0.0.0.0/0"
  network = "${var.vpc_id}"
  tags = ["${local.private_routing_tags}"]
  priority = "${local.private_route_regional_priority}"
  next_hop_ip = "${element(google_compute_address.private_primary.*.address, count.index)}"
}

resource "google_compute_route" "secondary_regional" {
  count = "${var.zonal_high_availability ? length(local.availability_zones) : 0}"

  name = "nat-1-${element(split("-", local.availability_zones[count.index]), 2)}-regional"
  dest_range = "0.0.0.0/0"
  network = "${var.vpc_id}"
  tags = ["${local.private_routing_tags}"]
  priority = "${local.private_route_regional_priority}"
  next_hop_ip = "${element(google_compute_address.private_secondary.*.address, count.index)}"

  depends_on = ["google_compute_route.primary_regional"]
}
