# Titan NAT Module - Routing Outputs

output "additional_private_routing_tags" { value = ["${var.additional_private_routing_tags}"] }
output "joined_private_routing_tags" { value = ["${concat(var.private_routing_tags, var.additional_private_routing_tags)}"] }
output "private_route_ids" { value = ["${google_compute_route.primary.*.self_link}"] }
output "private_route_priority" { value = "${var.private_route_priority}" }
output "private_routing_tags" { value = ["${var.private_routing_tags}"] }
