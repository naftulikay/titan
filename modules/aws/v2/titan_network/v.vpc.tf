# Titan Network Module - VPC Variables

variable domain_name_servers {
  type = list(string)
  default = ["AmazonProvidedDNS"]

  description = <<-EOF
    A list of up to three DNS resolvers to be broadcast to hosts on the network via DHCP. Pass additional IP addresses
    or DNS names (with an understanding of the consequences) to specify outside DNS resolvers.

    Default: `AmazonProvidedDNS` - Route 53 internal resolver.

    See: https://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_DHCP_Options.html
  EOF
}

variable instance_tenancy {
  default = "default"

  description = <<-EOF
    Instance tenancy for EC2 instances launched in this Titan network's VPC.

    Default: `default`.

    See: https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/dedicated-instance.html
  EOF
}

variable netbios_name_servers {
  type = list(string)
  default = []

  description = <<-EOF
    A list of up to four IP addressses of NetBIOS name servers.

    See: https://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_DHCP_Options.html
  EOF
}

variable netbios_node_type {
  default = 2

  description = <<-EOF
    The NetBIOS node type (1, 2, 4, or 8).

    It is recommended that this be left with a default of 2.

    See: https://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_DHCP_Options.html
  EOF
}

variable network_id {
  description = <<-EOF
    The second octet to use for this Titan network.

    In compliance with RFC 1918, the first octet is hard-coded to 10, as this is the only reserved address block which
    is a `/8` dedicated to private networking. This `network_id` is the second octet and is used to create a `/16` for
    this Titan network.
  EOF
}

variable ntp_servers {
  type = list(string)
  default = ["169.254.169.123"]

  description = <<-EOF
    A list of up to four NTP servers to be broadcast to hosts on the network via DHCP.

    **NOTE:** Amazon offers a completely internal NTP server in every region at 169.254.169.123. However, as per the
    documentation linked below, it is lacking support for M5 and C5 instances at present.

    Default: Use Amazon's internal NTP host for EC2.

    See:
      - https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/set-time.html
      - https://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/VPC_DHCP_Options.html
  EOF
}

variable subnets_per_layer {
  default = "3"

  description = <<-EOF
    The amount of subnets to create per layer. Titan layers are composed of this number of subnets distributed across
    availability zones.

    **NOTE:** Think carefully before changing this value. At minimum, it is advisable to leave this at the default of
    3. At maximum, 5 subnets are supported as layers are offset by ten values in the third octet and most subnets are
    /23s.

    Default: 3
  EOF
}
