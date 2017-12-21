# Titan Environment Module - Routing Resources

# NOTE: These routes are only one-way, they must have counterpart routes back to the Titan Environment from the Hub.
resource "aws_route" "hub_ipv4" {
  # FIXME due to cross-module issues: "value of 'count' cannot be computed," we have to calculate this
  count = "${var.peering_include_public ?
    var.subnets_per_layer * 6 :
    var.subnets_per_layer * 5
  }"

  destination_cidr_block = "${var.hub_cidr_block}"

  route_table_id = "${var.peering_include_public ?
    module.network.all_subnet_route_table_ids[count.index] :
    module.network.private_route_table_ids[count.index]
  }"

  vpc_peering_connection_id = "${aws_vpc_peering_connection.hub.id}"
}

resource "aws_route" "hub_ipv6" {
  # FIXME due to cross-module issues: "value of 'count' cannot be computed," we have to calculate this"
  count = "${var.peering_include_public ?
    var.subnets_per_layer * 6 :
    var.subnets_per_layer * 5
  }"

  destination_ipv6_cidr_block = "${var.hub_ipv6_cidr_block}"

  route_table_id = "${var.peering_include_public ?
    module.network.all_subnet_route_table_ids[count.index] :
    module.network.private_route_table_ids[count.index]
  }"

  vpc_peering_connection_id = "${aws_vpc_peering_connection.hub.id}"
}
