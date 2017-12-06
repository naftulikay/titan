# TITAN Network Module - Route 53 Resources

# Set of Name Servers for Public DNS Resolution
resource "aws_route53_delegation_set" "default" {
  reference_name = "${var.name_short}.${var.domain}"
}

# Public Route 53 Hosted Zone
resource "aws_route53_zone" "public" {
  name = "${var.name_short}.${var.domain}"
  delegation_set_id = "${aws_route53_delegation_set.default.id}"

  tags {
    Name = "${var.name_fancy} Public Hosted Zone"
    titan_zone = "${var.name_short}.${var.domain}"
    titan_dns_horizon = "public"
  }
}

# Private/Internal Route 53 Hosted Zone
resource "aws_route53_zone" "private" {
  name = "${var.name_short}.${var.domain}"
  vpc_id = "${aws_vpc.default.id}"

  tags {
    Name = "${var.name_fancy} Private Hosted Zone"
    titan_zone = "${var.name_short}.${var.domain}"
    titan_dns_horizon = "private"
  }
}

# Reverse Route 53 Hosted Zone
resource "aws_route53_zone" "reverse" {
  name = "${var.network_id}.10.in-addr.arpa"
  vpc_id = "${aws_vpc.default.id}"

  tags {
    Name = "${var.name_fancy} Reverse Hosted Zone"
    titan_zone = "${var.name_short}.${var.domain}"
    titan_dns_horizon = "private"
  }
}
