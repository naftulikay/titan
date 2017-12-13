# TITAN Network Module - Layer Resources

# The DMZ Layer: WAN-Facing
module "dmz_layer" {
  source = "../titan_layer"

  name = "dmz"
  is_public = true
  availability_zones = ["${slice(data.aws_availability_zones.default.names, 0, var.subnets_per_layer)}"]
  network_cidr_block = "${aws_vpc.default.cidr_block}"
  network_ipv6_cidr_block = "${aws_vpc.default.ipv6_cidr_block}"
  network_name = "${var.name}"
  vpc_id = "${aws_vpc.default.id}"
  zone = "${var.name_short}.${var.domain}"
  internet_gateway_id = "${aws_internet_gateway.default.id}"
  cidr_start = "${0 * 5}"
}

# The Routing Layer: Layer 5 and Layer 7 Routing
module "routing_layer" {
  source = "../titan_layer"

  name = "routing"
  availability_zones = ["${slice(data.aws_availability_zones.default.names, 0, var.subnets_per_layer)}"]
  network_cidr_block = "${aws_vpc.default.cidr_block}"
  network_ipv6_cidr_block = "${aws_vpc.default.ipv6_cidr_block}"
  network_name = "${var.name}"
  vpc_id = "${aws_vpc.default.id}"
  zone = "${var.name_short}.${var.domain}"
  cidr_start = "${1 * 5}"
  egress_only_gateway_id = "${aws_egress_only_internet_gateway.default.id}"
  nat_gateway_ids = "${aws_nat_gateway.default.*.id}"
}

# The Service Layer: Application Servers and Services
module "service_layer" {
  source = "../titan_layer"

  name = "service"
  availability_zones = ["${slice(data.aws_availability_zones.default.names, 0, var.subnets_per_layer)}"]
  network_cidr_block = "${aws_vpc.default.cidr_block}"
  network_ipv6_cidr_block = "${aws_vpc.default.ipv6_cidr_block}"
  network_name = "${var.name}"
  vpc_id = "${aws_vpc.default.id}"
  zone = "${var.name_short}.${var.domain}"
  cidr_start = "${2 * 5}"
  egress_only_gateway_id = "${aws_egress_only_internet_gateway.default.id}"
  nat_gateway_ids = "${aws_nat_gateway.default.*.id}"
}

# The Data Layer: Data-Stores
module "data_layer" {
  source = "../titan_layer"

  name = "data"
  availability_zones = ["${slice(data.aws_availability_zones.default.names, 0, var.subnets_per_layer)}"]
  network_cidr_block = "${aws_vpc.default.cidr_block}"
  network_ipv6_cidr_block = "${aws_vpc.default.ipv6_cidr_block}"
  network_name = "${var.name}"
  vpc_id = "${aws_vpc.default.id}"
  zone = "${var.name_short}.${var.domain}"
  cidr_start = "${3 * 5}"
  egress_only_gateway_id = "${aws_egress_only_internet_gateway.default.id}"
  nat_gateway_ids = "${aws_nat_gateway.default.*.id}"
}

# The Admin Layer: Administrative Services
module "admin_layer" {
  source = "../titan_layer"

  name = "admin"
  availability_zones = ["${slice(data.aws_availability_zones.default.names, 0, var.subnets_per_layer)}"]
  network_cidr_block = "${aws_vpc.default.cidr_block}"
  network_ipv6_cidr_block = "${aws_vpc.default.ipv6_cidr_block}"
  network_name = "${var.name}"
  vpc_id = "${aws_vpc.default.id}"
  zone = "${var.name_short}.${var.domain}"
  cidr_start = "${4 * 5}"
  egress_only_gateway_id = "${aws_egress_only_internet_gateway.default.id}"
  nat_gateway_ids = "${aws_nat_gateway.default.*.id}"
}

# The Net Layer: Networking Equipment and Services
module "net_layer" {
  source = "../titan_layer"

  name = "net"
  availability_zones = ["${slice(data.aws_availability_zones.default.names, 0, var.subnets_per_layer)}"]
  network_cidr_block = "${aws_vpc.default.cidr_block}"
  network_ipv6_cidr_block = "${aws_vpc.default.ipv6_cidr_block}"
  network_name = "${var.name}"
  vpc_id = "${aws_vpc.default.id}"
  zone = "${var.name_short}.${var.domain}"

  # this layer consists of n /24s as opposed to n /23s
  cidr_start = 250
  cidr_mask_bits = 8

  egress_only_gateway_id = "${aws_egress_only_internet_gateway.default.id}"
  nat_gateway_ids = "${aws_nat_gateway.default.*.id}"
}
