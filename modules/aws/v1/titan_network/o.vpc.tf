# Titan Network Module - VPC Outputs

output cidr_block {
  value = aws_vpc.default.cidr_block

  description = <<-EOF
    IPv4 CIDR block occupied by this Titan network.

    Generally this will be `10.$${var.network_id}.0.0/16`.
  EOF
}

output default_network_acl_id {
  value = aws_vpc.default.default_network_acl_id

  description = <<-EOF
    The ID of the default network ACL created by AWS for this Titan network.

    See: https://www.terraform.io/docs/providers/aws/r/vpc.html
  EOF
}

output default_route_table_id {
  value = aws_vpc.default.default_route_table_id

  description = <<-EOF
    The ID of the default route table created by AWS for this Titan network.

    See: https://www.terraform.io/docs/providers/aws/r/vpc.html
  EOF
}

output dhcp_options_id {
  value = aws_vpc_dhcp_options.default.id

  description = <<-EOF
    The id of this Titan network's DHCP options set.

    See: https://www.terraform.io/docs/providers/aws/r/vpc_dhcp_options.html
  EOF
}

output dhcp_options_association_id {
  value = aws_vpc_dhcp_options_association.default.id

  description = <<-EOF
    The id of this Titan network's DHCP options set association.

    See: https://www.terraform.io/docs/providers/aws/r/vpc_dhcp_options_association.html
  EOF
}

output domain_name_servers {
  value = var.domain_name_servers

  description = <<-EOF
    A list of DNS resolvers for this Titan network.

    See: https://www.terraform.io/docs/providers/aws/r/vpc.html
  EOF
}

output egress_only_internet_gateway_id {
  value = aws_egress_only_internet_gateway.default.id

  description = <<-EOF
    ID for the IPv6 egress-only internet gateway for this Titan network.
  EOF
}

output id {
  value = var.network_id

  description = <<-EOF
    Synonym for `network_id`, the second IP octet uniquely identifying this Titan network.
  EOF
}

output instance_tenancy {
  value = var.instance_tenancy

  description = <<-EOF
    Instance tenancy for EC2 instances launched in this Titan network's VPC.

    See: https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/dedicated-instance.html
  EOF
}

output internet_gateway_id {
  value = aws_internet_gateway.default.id

  description = <<-EOF
    ID for the IPv4 internet gateway for this Titan network.
  EOF
}

output ipv6_association_id {
  value = aws_vpc.default.ipv6_association_id

  description = <<-EOF
    The association ID for the IPv6 CIDR block of this Titan network's VPC.
  EOF
}

output ipv6_cidr_block {
  value = aws_vpc.default.ipv6_cidr_block

  description = <<-EOF
    The IPv6 CIDR block automatically assigned to this Titan network by AWS.
  EOF
}

output main_route_table_id {
  value = aws_vpc.default.main_route_table_id

  description = <<-EOF
    The ID of the main route table created by default by AWS for this Titan network.
  EOF
}

output netbios_name_servers {
  value = var.netbios_name_servers

  description = <<-EOF
    The NetBIOS name servers for this Titan network.
  EOF
}

output netbios_node_type {
  value = var.netbios_node_type

  description = <<-EOF
    The NetBIOS node type (1, 2, 4, or 8).
  EOF
}

output network_id {
  value = var.network_id

  description = <<-EOF
    The second IP octet uniquely identifiing this Titan network.
  EOF
}

output ntp_servers {
  value = var.ntp_servers

  description = <<-EOF
    A list of up to four NTP servers broadcast to hosts via DHCP within this Titan network.
  EOF
}

output octet_0 {
  value = "10"

  description = <<-EOF
    The first octet of this Titan network's space.

    In compliance with RFC 1918, the first octet is hard-coded to 10, as this is the only reserved address block which
    is a `/8` dedicated to private networking.
  EOF
}

output octet_1 {
  value = var.network_id

  description = <<-EOF
    Synonym for `network_id`, the second IP octet uniquely identifying this Titan network.
  EOF
}

output subnets_per_layer {
  value = var.subnets_per_layer

  description = <<-EOF
    The amount of subnets contained in a single Titan layer for this network.
  EOF
}

output vpc_id {
  value = aws_vpc.default.id

  description = <<-EOF
    VPC identifier for this Titan network.
  EOF
}
