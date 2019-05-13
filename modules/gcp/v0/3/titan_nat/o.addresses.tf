# Titan NAT Module - IP Address Outputs

output "primary_external_ips" { value = ["${google_compute_address.primary_external.*.address}"] }
output "primary_external_ip_ids" { value = ["${google_compute_address.primary_external.*.self_link}"] }
output "primary_internal_ips" { value = ["${google_compute_address.primary_internal.*.address}"] }
output "primary_internal_ip_ids" { value = ["${google_compute_address.primary_internal.*.self_link}"] }
