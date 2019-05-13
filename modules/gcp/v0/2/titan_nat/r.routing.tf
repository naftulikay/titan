# Titan NAT Module - Routing Resources

resource "google_compute_route" "primary" {
  count = "${length(local.availability_zones)}"

  name = "nat-0-${element(split("-", local.availability_zones[count.index]), 2)}"
  dest_range = "0.0.0.0/0"
  network = "${var.vpc_id}"
  tags = ["${concat(
    var.private_routing_tags,
    var.additional_private_routing_tags,
    list("nat-${local.availability_zones[count.index]}"))
  }"]
  priority = "${var.private_route_priority}"
  next_hop_ip = "${element(google_compute_address.primary_internal.*.address, count.index)}"
}
