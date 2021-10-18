# Titan Network Module - DMZ Layer Outputs

output dmz_cidr_blocks {
  value = module.dmz_layer.cidr_blocks

  description = <<-EOF
    A list of private IPv4 CIDR blocks for each of the subnets in the DMZ Titan layer.

    There will be `$${var.subnets_per_layer}` values in this list.
  EOF
}

output dmz_ipv6_cidr_block_association_ids {
    value = module.dmz_layer.ipv6_cidr_block_association_ids

    description = <<-EOF
      A list of IPv6 CIDR block association ids for each of the subnets in the DMZ Titan layer.

      There will be `$${var.subnets_per_layer}` values in this list.
    EOF
}

output dmz_ipv6_cidr_blocks {
  value = module.dmz_layer.ipv6_cidr_blocks

  description = <<-EOF
    A list of IPv6 CIDR blocks for each of the subnets in the DMZ Titan layer.

    There will be `$${var.subnets_per_layer}` values in this list.
  EOF
}

output dmz_network_acl_id {
  value = module.dmz_layer.network_acl_id

  description = <<-EOF
    Id of the network ACL shared by all subnets in the DMZ Titan layer.
  EOF
}

output dmz_route_table_ids {
  value = module.dmz_layer.route_table_ids

  description = <<-EOF
    A list of route table ids for each of the subnets in the DMZ Titan layer.

    There will be `$${var.subnets_per_layer}` values in this list.
  EOF
}

output dmz_subnet_ids {
  value = module.dmz_layer.subnet_ids

  description = <<-EOF
    A list of subnet ids for each of the subnets in the DMZ Titan layer.

    There will be `$${var.subnets_per_layer}` values in this list.
  EOF
}
