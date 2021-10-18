# Titan Layer Module - NAT Outputs

output nat_enabled {
  value = var.nat_enabled

  description = <<-EOF
    Whether NAT gateways and relevant resources are created.
  EOF
}