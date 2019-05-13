# Titan Network Module - DNS Outputs

output "name_servers" { value = ["${google_dns_managed_zone.public.name_servers}"] }
