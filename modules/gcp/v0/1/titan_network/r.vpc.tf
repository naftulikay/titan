# Titan Network Module - VPC Resources

resource "google_compute_network" "default" {
  name = "titan-network-${var.name_short}"
  description = "Titan ${var.name_fancy} Network"
  auto_create_subnetworks = false
  routing_mode = "REGIONAL"
}


