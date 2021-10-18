# Titan Network Module - NAT Gateway Outputs

output nat_enabled {
  value = var.nat_enabled

  description = <<-EOF
    Whether NAT gateways and relevant resources are created.
  EOF
}

output nat_allocation_ids {
  value = aws_nat_gateway.default.*.allocation_id

  description = <<-EOF
    The Elastic IP allocation ids for each NAT Gateway in this Titan network.

    There will be `$${var.subnets_per_layer}` values in this list.
  EOF
}

output nat_gateway_ids {
  value = aws_nat_gateway.default.*.id

  description = <<-EOF
    Ids for each NAT Gateway in this Titan network.

    There will be `$${var.subnets_per_layer}` values in this list.
  EOF
}

output nat_subnet_ids {
  value = aws_nat_gateway.default.*.subnet_id

  description = <<-EOF
    The ids of the subnets associated with each NAT Gateway.

    NAT Gateways live in the DMZ layer, facing WAN, therefore this value will be the same subnets output by the DMZ
    layer module. There will be `$${var.subnets_per_layer}` values in this list.
  EOF
}

output nat_interface_ids {
  value = aws_nat_gateway.default.*.network_interface_id

  description = <<-EOF
    The ids of the network interfaces associated with each NAT Gateway.

    There will be `$${var.subnets_per_layer}` values in this list.
  EOF
}

output nat_private_ips {
  value = aws_nat_gateway.default.*.private_ip

  description = <<-EOF
    The private IPv4 addresses of each NAT Gateway.

    There will be `$${var.subnets_per_layer}` values in this list.
  EOF
}

output nat_public_ips {
  value = aws_nat_gateway.default.*.public_ip

  description = <<-EOF
    The public IPv4 addresses of each NAT Gateway.

    There will be `$${var.subnets_per_layer}` values in this list.
  EOF
}
