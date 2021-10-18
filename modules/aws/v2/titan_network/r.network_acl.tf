# Titan Network Module - Network ACL Resources

# The Default Network ACL for the VPC; only used when a new subnet is created outside of Titan
resource aws_default_network_acl default {
  default_network_acl_id = aws_vpc.default.default_network_acl_id

  # IPv4 Ingress
  ingress {
    rule_no = 1000
    protocol = "all"
    action = "allow"
    from_port = 0
    to_port = 0
    ipv6_cidr_block = "::/0"
  }

  # IPv6 Ingress
  ingress {
    rule_no = 1001
    protocol = "all"
    action = "allow"
    from_port = 0
    to_port = 0
    ipv6_cidr_block = "::/0"
  }

  # IPv4 Egress
  egress {
    rule_no    = 1000
    protocol   = "all"
    action     = "allow"
    from_port = 0
    to_port = 0
    cidr_block = "0.0.0.0/0"
  }

  # IPv6 Egress
  egress {
    rule_no    = 1001
    protocol   = "all"
    action     = "allow"
    from_port = 0
    to_port = 0
    ipv6_cidr_block = "::/0"
  }

  tags = {
    Name = "${var.name_short}.${var.domain} Default Network ACL"
    titan_network = var.name
    titan_zone = "${var.name_short}.${var.domain}"
  }
}
