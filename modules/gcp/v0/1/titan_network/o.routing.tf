# Titan Network Module - Routing Outputs

output "additional_public_route_tags" { value = ["${var.additional_public_route_tags}"] }
output "joined_public_route_tags" { value = ["${concat(var.public_route_tags, var.additional_public_route_tags)}"] } 
output "public_route_id" { value = "${google_compute_route.public.self_link}" }
output "public_route_priority" { value = "${var.public_route_priority}" }
output "public_route_tags" { value = ["${var.public_route_tags}"] }
