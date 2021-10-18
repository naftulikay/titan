# Titan Network Module - VPC Resources

# VPC
resource aws_vpc default {
  cidr_block = "10.${var.network_id}.0.0/16"
  instance_tenancy = var.instance_tenancy

  assign_generated_ipv6_cidr_block = true

  enable_classiclink = false
  enable_dns_hostnames = true
  enable_dns_support = true

  tags = {
    Name = "${var.name_short}.${var.domain}"
    titan_network = var.name
    titan_zone = "${var.name_short}.${var.domain}"
  }
}

# The VPC's DHCP Options Set
resource aws_vpc_dhcp_options default {
  domain_name = "${var.name_short}.${var.domain}"

  domain_name_servers = var.domain_name_servers

  ntp_servers = var.ntp_servers

  netbios_name_servers = var.netbios_name_servers
  netbios_node_type = var.netbios_node_type

  tags = {
    Name = "${var.name_short}.${var.domain}"
    titan_network = var.name
    titan_zone = "${var.name_short}.${var.domain}"
  }

  lifecycle {
    create_before_destroy = true
  }
}

# Associate the DHCP Options Set with the VPC
resource aws_vpc_dhcp_options_association default {
  vpc_id = aws_vpc.default.id
  dhcp_options_id = aws_vpc_dhcp_options.default.id
}

# Internet Gateway for the VPC (IPv4)
resource aws_internet_gateway default {
  vpc_id = aws_vpc.default.id

  tags = {
    Name = "${var.name_short}.${var.domain}"
    titan_network = var.name
    titan_zone = "${var.name_short}.${var.domain}"
  }
}

# Egress-Only Internet Gateway for the VPC (IPv6)
resource aws_egress_only_internet_gateway default {
  vpc_id = aws_vpc.default.id
}
