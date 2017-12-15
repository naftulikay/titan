# TITAN Layer Module - Routing Resources

# Route Table for Each Subnet
resource "aws_route_table" "default" {
  count = "${length(var.availability_zones)}"

  vpc_id = "${var.vpc_id}"

  # tags
  tags {
    Name = "${var.name}-${count.index}.${var.zone}"
    titan_layer = "${var.name}"
    titan_network = "${var.network_name}"
    titan_zone = "${var.zone}"
  }
}

resource "aws_route_table_association" "default" {
  count = "${length(var.availability_zones)}"

  subnet_id = "${element(aws_subnet.default.*.id, count.index)}"
  route_table_id = "${element(aws_route_table.default.*.id, count.index)}"
}

# Route for Public, WAN-Facing Layers
resource "aws_route" "public" {
  # only created for public layers
  count = "${var.is_public ? length(var.availability_zones) : 0}"

  route_table_id = "${element(aws_route_table.default.*.id, count.index)}"
  gateway_id = "${var.internet_gateway_id}"
  destination_cidr_block = "0.0.0.0/0"
}

resource "aws_route" "public_ipv6" {
  # only created for public layers
  count = "${var.is_public ? length(var.availability_zones) : 0}"

  route_table_id = "${element(aws_route_table.default.*.id, count.index)}"
  gateway_id = "${var.internet_gateway_id}"
  destination_ipv6_cidr_block = "::/0"
}

# Route for Private, NAT Layers
resource "aws_route" "private" {
  # only created for private layers
  count = "${var.is_public ? 0 : length(var.availability_zones)}"

  route_table_id = "${element(aws_route_table.default.*.id, count.index)}"
  # there must be one NAT gateway per availability zone, hence 1:1 route table to NAT gateway
  nat_gateway_id = "${var.nat_gateway_ids[count.index]}"
  destination_cidr_block = "0.0.0.0/0"
}

resource "aws_route" "private_ipv6" {
  # only created for private layers
  count = "${var.is_public ? 0 : length(var.availability_zones)}"

  route_table_id = "${element(aws_route_table.default.*.id, count.index)}"
  egress_only_gateway_id = "${var.egress_only_gateway_id}"
  destination_ipv6_cidr_block = "::/0"
}
