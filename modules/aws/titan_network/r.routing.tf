# TITAN Network Module - Routing Resources

# The Default Route Table for the VPC; only used when a new subnet is created outside of TITAN
resource "aws_default_route_table" "r" {
  default_route_table_id = "${aws_vpc.default.default_route_table_id}"

  # IPv4 summary route via first NAT Gatweway
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = "${element(aws_nat_gateway.default.*.id, 0)}"
  }

  # IPv6 summary route via Egress-Only Internet Gateway
  route {
    egress_only_gateway_id = "${aws_egress_only_internet_gateway.default.id}"
    ipv6_cidr_block = "::/0"
  }

  tags {
    Name = "${var.name_short}.${var.domain} Default Route Table"
    titan_network = "${var.name}"
    titan_zone = "${var.name_short}.${var.domain}"
  }
}
