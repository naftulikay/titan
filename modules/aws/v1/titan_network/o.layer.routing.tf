# Titan Network Module - Routing Layer Outputs

output routing_cidr_blocks {
  value = module.routing_layer.cidr_blocks

  description = <<-EOF
    A list of private IPv4 CIDR blocks for each of the subnets in the routing Titan layer.

    There will be `$${var.subnets_per_layer}` values in this list.
  EOF
}

output routing_ipv6_cidr_block_association_ids {
    value = module.routing_layer.ipv6_cidr_block_association_ids

    description = <<-EOF
      A list of IPv6 CIDR block association ids for each of the subnets in the routing Titan layer.

      There will be `$${var.subnets_per_layer}` values in this list.
    EOF
}

output routing_ipv6_cidr_blocks {
  value = module.routing_layer.ipv6_cidr_blocks

  description = <<-EOF
    A list of IPv6 CIDR blocks for each of the subnets in the routing Titan layer.

    There will be `$${var.subnets_per_layer}` values in this list.
  EOF
}

output routing_network_acl_id {
  value = module.routing_layer.network_acl_id

  description = <<-EOF
    Id of the network ACL shared by all subnets in the routing Titan layer.
  EOF
}

output routing_route_table_ids {
  value = module.routing_layer.route_table_ids

  description = <<-EOF
    A list of route table ids for each of the subnets in the routing Titan layer.

    There will be `$${var.subnets_per_layer}` values in this list.
  EOF
}

output routing_subnet_ids {
  value = module.routing_layer.subnet_ids

  description = <<-EOF
    A list of subnet ids for each of the subnets in the routing Titan layer.

    There will be `$${var.subnets_per_layer}` values in this list.
  EOF
}
