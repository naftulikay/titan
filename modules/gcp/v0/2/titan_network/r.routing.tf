# Titan Network Module - Routing Resources

# Route for Public, WAN-Facing Layers
resource "google_compute_route" "public" {
  # only created for public layers
  name = "public"
  dest_range = "0.0.0.0/0"
  network = "${google_compute_network.default.self_link}"
  # all traffic will egress through the network's default internet gateway. this route should only apply to public
  # titan layers. private layers will have their own unique routes using NAT gateways to enforce privacy.
  next_hop_gateway = "default-internet-gateway"
  priority = "${var.public_route_priority}"

  tags = ["${concat(var.public_route_tags, var.additional_public_route_tags)}"]
}
