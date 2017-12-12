# TITAN Layer Module - Subnet Resources

resource "aws_subnet" "default" {
  count = "${length(var.availability_zones)}"

  vpc_id = "${var.vpc_id}"

  availability_zone = "${element(var.availability_zones, count.index)}"
  cidr_block = "${cidrsubnet("${var.network_cidr_block}", var.cidr_mask_bits, var.cidr_start + count.index)}"
  ipv6_cidr_block = "${cidrsubnet(var.network_ipv6_cidr_block, 10, var.cidr_start + count.index)}"

  map_public_ip_on_launch = "${var.is_public}"
  assign_ipv6_address_on_creation = true

  # tags
  tags {
    Name = "${var.name}-${count.index}.${var.zone}"
    titan_layer = "${var.name}"
    titan_network = "${var.network_name}"
    titan_zone = "${var.zone}"
  }
}
