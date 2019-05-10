# Titan NAT Module - Instance Group Outputs

output "healthcheck_id" { value = "${google_compute_health_check.default.self_link}" }
output "primary_instance_group_ids" { value = ["${google_compute_instance_group_manager.primary.*.instance_group}"] }
output "primary_instance_group_manager_ids" { value = ["${google_compute_instance_group_manager.primary.*.self_link}"] }
