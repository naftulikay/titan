# Titan Network Module - Net Layer Outputs

output net_cidr_blocks {
  value = module.net_layer.cidr_blocks

  description = <<-EOF
    A list of private IPv4 CIDR blocks for each of the subnets in the net Titan layer.

    There will be `$${var.subnets_per_layer}` values in this list.
  EOF
}

output net_ipv6_cidr_block_association_ids {
    value = module.net_layer.ipv6_cidr_block_association_ids

    description = <<-EOF
      A list of IPv6 CIDR block association ids for each of the subnets in the net Titan layer.

      There will be `$${var.subnets_per_layer}` values in this list.
    EOF
}

output net_ipv6_cidr_blocks {
  value = module.net_layer.ipv6_cidr_blocks

  description = <<-EOF
    A list of IPv6 CIDR blocks for each of the subnets in the net Titan layer.

    There will be `$${var.subnets_per_layer}` values in this list.
  EOF
}

output net_network_acl_id {
  value = module.net_layer.network_acl_id

  description = <<-EOF
    Id of the network ACL shared by all subnets in the net Titan layer.
  EOF
}

output net_route_table_ids {
  value = module.net_layer.route_table_ids

  description = <<-EOF
    A list of route table ids for each of the subnets in the net Titan layer.

    There will be `$${var.subnets_per_layer}` values in this list.
  EOF
}

output net_subnet_ids {
  value = module.net_layer.subnet_ids

  description = <<-EOF
    A list of subnet ids for each of the subnets in the net Titan layer.

    There will be `$${var.subnets_per_layer}` values in this list.
  EOF
}
