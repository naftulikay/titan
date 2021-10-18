# Titan Network Module - NAT Variables

variable nat_enabled {
  type = bool
  default = true

  description = <<-EOF
    Whether to create NAT gateways and relevant routes and resources.
  EOF
}