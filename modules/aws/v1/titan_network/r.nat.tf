# Titan Network Module - NAT Gateway Resources

# NAT Gateways per Availability Zone
resource "aws_nat_gateway" "default" {
  count = "${var.subnets_per_layer}"

  allocation_id = "${element(aws_eip.nat.*.id, count.index)}"
  subnet_id = "${module.dmz_layer.subnet_ids[count.index]}"

  tags {
    Name = "nat-${count.index}.${var.name_short}.${var.domain}"
    titan_layer = "dmz"
    titan_network = "${var.name}"
    titan_zone = "${var.name_short}.${var.domain}"
  }
}

# Elastic IP Allocation per NAT Gateway
resource "aws_eip" "nat" {
  count = "${var.subnets_per_layer}"

  vpc = true
}
