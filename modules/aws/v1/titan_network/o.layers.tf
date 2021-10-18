# Titan Network Module - Layer Outputs

output all_subnet_cidr_blocks {
  value = concat(
      module.dmz_layer.cidr_blocks,
      module.routing_layer.cidr_blocks,
      module.service_layer.cidr_blocks,
      module.data_layer.cidr_blocks,
      module.admin_layer.cidr_blocks,
      module.net_layer.cidr_blocks
  )

  description = <<-EOF
    A list of all IPv4 CIDR blocks for all subnets in all layers in ascending order.

    These values may be easily associated with availability zones and arbitrary layers by using the modulo operator
    around the value of `$${var.subnets_per_az}`.
  EOF
}

output all_subnet_ids {
  value = concat(
      module.dmz_layer.subnet_ids,
      module.routing_layer.subnet_ids,
      module.service_layer.subnet_ids,
      module.data_layer.subnet_ids,
      module.admin_layer.subnet_ids,
      module.net_layer.subnet_ids
  )

  description = <<-EOF
    A list of all subnet ids for all subnets in all layers in ascending order.

    These values may be easily associated with availability zones and arbitrary layers by using the modulo operator
    around the value of `$${var.subnets_per_az}`.
  EOF
}

output all_subnet_ipv6_cidr_block_association_ids {
  value = concat(
      module.dmz_layer.ipv6_cidr_block_association_ids,
      module.routing_layer.ipv6_cidr_block_association_ids,
      module.service_layer.ipv6_cidr_block_association_ids,
      module.data_layer.ipv6_cidr_block_association_ids,
      module.admin_layer.ipv6_cidr_block_association_ids,
      module.net_layer.ipv6_cidr_block_association_ids
  )

  description = <<-EOF
    A list of all IPv6 CIDR block association ids for all subnets in all layers in ascending order.

    These values may be easily associated with availability zones and arbitrary layers by using the modulo operator
    around the value of `$${var.subnets_per_az}`.
  EOF
}

output all_subnet_ipv6_cidr_blocks {
  value = concat(
      module.dmz_layer.ipv6_cidr_blocks,
      module.routing_layer.ipv6_cidr_blocks,
      module.service_layer.ipv6_cidr_blocks,
      module.data_layer.ipv6_cidr_blocks,
      module.admin_layer.ipv6_cidr_blocks,
      module.net_layer.ipv6_cidr_blocks
  )

  description = <<-EOF
    A list of all IPv6 CIDR blocks for all subnets in all layers in ascending order.

    These values may be easily associated with availability zones and arbitrary layers by using the modulo operator
    around the value of `$${var.subnets_per_az}`.
  EOF
}

output all_subnet_network_acl_ids {
  value = [
    module.dmz_layer.network_acl_id,
    module.routing_layer.network_acl_id,
    module.service_layer.network_acl_id,
    module.data_layer.network_acl_id,
    module.admin_layer.network_acl_id,
    module.net_layer.network_acl_id
  ]

  description = <<-EOF
    A list of network ACLs for each layer (one ACL per layer, shared by all subnets in that layer).
  EOF
}

output all_subnet_route_table_ids {
  value = concat(
      module.dmz_layer.route_table_ids,
      module.routing_layer.route_table_ids,
      module.service_layer.route_table_ids,
      module.data_layer.route_table_ids,
      module.admin_layer.route_table_ids,
      module.net_layer.route_table_ids
  )

  description = <<-EOF
    A list of all route table ids for all subnets in all layers in ascending order.

    These values may be easily associated with availability zones and arbitrary layers by using the modulo operator
    around the value of `$${var.subnets_per_az}`.
  EOF
}

output public_cidr_blocks {
  value = module.dmz_layer.cidr_blocks

  description = <<-EOF
    A list of all IPv4 CIDR blocks for all public subnets in ascending order; the only public layer is the DMZ layer.

    These values may be easily associated with availability zones and arbitrary layers by using the modulo operator
    around the value of `$${var.subnets_per_az}`.
  EOF
}

output public_ipv6_cidr_block_association_ids {
  value = module.dmz_layer.ipv6_cidr_block_association_ids

  description = <<-EOF
    A list of all IPv6 CIDR block association ids for public subnets in ascending order; the only public layer is the
    DMZ layer.

    These values may be easily associated with availability zones and arbitrary layers by using the modulo operator
    around the value of `$${var.subnets_per_az}`.
  EOF
}

output public_ipv6_cidr_blocks {
  value = module.dmz_layer.ipv6_cidr_blocks

  description = <<-EOF
    A list of all IPv6 CIDR blocks for public subnets in ascending order; the only public layer is the DMZ layer.

    These values may be easily associated with availability zones and arbitrary layers by using the modulo operator
    around the value of `$${var.subnets_per_az}`.
  EOF
}

output public_network_acl_ids {
  value = module.dmz_layer.network_acl_id

  description = <<-EOF
    A list of all network ACL ids for public layers (one NACL per layer) in ascending order; the only public layer is
    the DMZ layer.

    These values may be easily associated with availability zones and arbitrary layers by using the modulo operator
    around the value of `$${var.subnets_per_az}`.
  EOF
}

output public_route_table_ids {
  value = module.dmz_layer.route_table_ids

  description = <<-EOF
    A list of all route table ids for public subnets in ascending order; the only public layer is the DMZ layer.

    These values may be easily associated with availability zones and arbitrary layers by using the modulo operator
    around the value of `$${var.subnets_per_az}`.
  EOF
}

output public_subnet_ids {
  value = module.dmz_layer.subnet_ids

  description = <<-EOF
    A list of all subnet ids for public layers in ascending order; the only public layer is the DMZ layer.

    These values may be easily associated with availability zones and arbitrary layers by using the modulo operator
    around the value of `$${var.subnets_per_az}`.
  EOF
}

output private_cidr_blocks {
  value = concat(
    module.routing_layer.cidr_blocks,
    module.service_layer.cidr_blocks,
    module.data_layer.cidr_blocks,
    module.admin_layer.cidr_blocks,
    module.net_layer.cidr_blocks
  )

  description = <<-EOF
    A list of all IPv4 CIDR blocks for all private subnets in ascending order.

    These values may be easily associated with availability zones and arbitrary layers by using the modulo operator
    around the value of `$${var.subnets_per_az}`.
  EOF
}

output private_ipv6_cidr_block_association_ids {
  value = concat(
    module.routing_layer.ipv6_cidr_block_association_ids,
    module.service_layer.ipv6_cidr_block_association_ids,
    module.data_layer.ipv6_cidr_block_association_ids,
    module.admin_layer.ipv6_cidr_block_association_ids,
    module.net_layer.ipv6_cidr_block_association_ids
  )

  description = <<-EOF
    A list of all IPv6 CIDR block association ids for private subnets in ascending order.

    These values may be easily associated with availability zones and arbitrary layers by using the modulo operator
    around the value of `$${var.subnets_per_az}`.
  EOF
}

output private_ipv6_cidr_blocks {
  value = concat(
    module.routing_layer.ipv6_cidr_blocks,
    module.service_layer.ipv6_cidr_blocks,
    module.data_layer.ipv6_cidr_blocks,
    module.admin_layer.ipv6_cidr_blocks,
    module.net_layer.ipv6_cidr_blocks
  )

  description = <<-EOF
    A list of all IPv6 CIDR blocks for private subnets in ascending order.

    These values may be easily associated with availability zones and arbitrary layers by using the modulo operator
    around the value of `$${var.subnets_per_az}`.
  EOF
}

output private_network_acl_ids {
  value = [
    module.routing_layer.network_acl_id,
    module.service_layer.network_acl_id,
    module.data_layer.network_acl_id,
    module.admin_layer.network_acl_id,
    module.net_layer.network_acl_id,
  ]

  description = <<-EOF
    A list of all network ACL ids for private layers (one NACL per layer) in ascending order.

    These values may be easily associated with availability zones and arbitrary layers by using the modulo operator
    around the value of `$${var.subnets_per_az}`.
  EOF
}

output private_route_table_ids {
  value = concat(
    module.routing_layer.route_table_ids,
    module.service_layer.route_table_ids,
    module.data_layer.route_table_ids,
    module.admin_layer.route_table_ids,
    module.net_layer.route_table_ids
  )

  description = <<-EOF
    A list of all route table ids for private subnets in ascending order.

    These values may be easily associated with availability zones and arbitrary layers by using the modulo operator
    around the value of `$${var.subnets_per_az}`.
  EOF
}

output private_subnet_ids {
  value = concat(
    module.routing_layer.subnet_ids,
    module.service_layer.subnet_ids,
    module.data_layer.subnet_ids,
    module.admin_layer.subnet_ids,
    module.net_layer.subnet_ids
  )

  description = <<-EOF
    A list of all subnet ids for private layers in ascending order.

    These values may be easily associated with availability zones and arbitrary layers by using the modulo operator
    around the value of `$${var.subnets_per_az}`.
  EOF
}
