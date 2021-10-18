# Titan Network Module - Routing Resources

# The Default Route Table for the VPC; only used when a new subnet is created outside of Titan
resource aws_default_route_table r {
  default_route_table_id = aws_vpc.default.default_route_table_id

  tags = {
    Name = "${var.name_short}.${var.domain} Default Route Table"
    titan_network = var.name
    titan_zone = "${var.name_short}.${var.domain}"
  }
}

resource aws_route ipv4_egress_nat {
  count = var.nat_enabled ? 1 : 0

  route_table_id = aws_default_route_table.r.id

  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id = aws_nat_gateway.default[0].id
}

resource aws_route ipv4_egress_public {
  count = var.nat_enabled ? 0 : 1

  route_table_id = aws_default_route_table.r.id

  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.default.id
}

resource aws_route ipv6 {
  route_table_id = aws_default_route_table.r.id

  destination_ipv6_cidr_block = "::/0"
  egress_only_gateway_id = aws_egress_only_internet_gateway.default.id
}