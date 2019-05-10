# Titan NAT Module - Firewall Outputs

output "healthcheck_firewall_id" { value = "${google_compute_firewall.health_check.self_link}" }
output "ssh_firewall_id" { value = "${google_compute_firewall.nat_ssh.self_link}" }
output "summary_firewall_id" { value = "${google_compute_firewall.nat_summary.self_link}" }
