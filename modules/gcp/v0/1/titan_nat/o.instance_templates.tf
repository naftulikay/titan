# Titan NAT Module - Instance Template Outputs

output "instance_template_ids" { value = ["${google_compute_instance_template.primary.*.self_link}"] }
