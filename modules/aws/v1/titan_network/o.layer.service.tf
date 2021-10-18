# Titan Network Module - Service Layer Outputs

output service_cidr_blocks {
  value = module.service_layer.cidr_blocks

  description = <<-EOF
    A list of private IPv4 CIDR blocks for each of the subnets in the service Titan layer.

    There will be `$${var.subnets_per_layer}` values in this list.
  EOF
}

output service_ipv6_cidr_block_association_ids {
    value = module.service_layer.ipv6_cidr_block_association_ids

    description = <<-EOF
      A list of IPv6 CIDR block association ids for each of the subnets in the service Titan layer.

      There will be `$${var.subnets_per_layer}` values in this list.
    EOF
}

output service_ipv6_cidr_blocks {
  value = module.service_layer.ipv6_cidr_blocks

  description = <<-EOF
    A list of IPv6 CIDR blocks for each of the subnets in the service Titan layer.

    There will be `$${var.subnets_per_layer}` values in this list.
  EOF
}

output service_network_acl_id {
  value = module.service_layer.network_acl_id

  description = <<-EOF
    Id of the network ACL shared by all subnets in the service Titan layer.
  EOF
}

output service_route_table_ids {
  value = module.service_layer.route_table_ids

  description = <<-EOF
    A list of route table ids for each of the subnets in the service Titan layer.

    There will be `$${var.subnets_per_layer}` values in this list.
  EOF
}

output service_subnet_ids {
  value = module.service_layer.subnet_ids

  description = <<-EOF
    A list of subnet ids for each of the subnets in the service Titan layer.

    There will be `$${var.subnets_per_layer}` values in this list.
  EOF
}
