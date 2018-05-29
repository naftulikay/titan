# Titan Layer Module - Subnet Outputs

output "cidr_blocks" { value = ["${local.primary_cidr_blocks}"] }
output "container_range_cidr_blocks" { value = ["${local.secondary_cidr_blocks}"] }
output "container_range_names" { value = ["${local.secondary_names}"] }
output "gateway_addresses" { value = ["${google_compute_subnetwork.default.*.gateway_address}"] }
output "subnet_ids" { value = ["${google_compute_subnetwork.default.*.self_link}"] }
output "subnet_names" { value = ["${google_compute_subnetwork.default.*.name}"] }
