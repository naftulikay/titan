# Titan Network Module - Outputs

output "cidr_block" { value = "${local.cidr_block}" }
output "domain" { value = "${var.domain}" }
output "id" { value = "${var.id}" }
output "name" { value = "${var.name}" }
output "name_fancy" { value = "${var.name_fancy}" }
output "name_short" { value = "${var.name_short}" }
output "region" { value = "${var.region}" }
output "vpc_id" { value = "${google_compute_network.default.self_link}" }

