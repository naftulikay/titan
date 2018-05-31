# Titan Layer Module - Subnet Outputs

output "cidr_blocks" { value = ["${local.primary_cidr_blocks}"] }
output "container_range_cidr_blocks" { value = ["${local.container_range_cidr_blocks}"] }
output "container_range_names" { value = ["${local.container_range_names}"] }
output "gateway_addresses" { value = ["${google_compute_subnetwork.default.*.gateway_address}"] }
output "management_range_cidr_blocks" { value = ["${local.management_range_cidr_blocks}"] }
output "management_range_names" { value = ["${local.management_range_names}"] }
output "subnet_ids" { value = ["${google_compute_subnetwork.default.*.self_link}"] }
output "subnet_names" { value = ["${google_compute_subnetwork.default.*.name}"] }
