# Titan Environment Module - Variables

variable hub_account_id {
  default = ""

  description = <<-EOF
    The AWS account id of the Titan Hub this Environment is peered to.

    This value only needs to be set if the Titan Hub lives in a different AWS account than this Environment.
  EOF
}

variable hub_cidr_block {
  description = <<-EOF
    The private IPv4 CIDR block for the Titan Hub this Environment is peered to.
  EOF
}

variable hub_ipv6_cidr_block {
  description = <<-EOF
    The IPv6 CIDR block for the Titan Hub this Environment is peered to.
  EOF
}

variable hub_name {
  description = <<-EOF
    The Titan Network name of the Titan Hub this Environment is peered to.
  EOF
}

variable hub_vpc_id {
  description = <<-EOF
    The VPC id of the Titan Hub this Environment is peered to.
  EOF
}

variable hub_zone {
  description = <<-EOF
    The hosted zone name of the Titan Hub this Environment is peered to.
  EOF
}

variable peering_include_public {
  default = false

  description = <<-EOF
    Whether to add peering routes to public (ie DMZ) subnets.

    By default, routes are added to only private subnets to enhance security. The primary use case of the DMZ layer is
    to provide WAN-facing load balancers which route traffic into the routing layer, therefore, if this is the case,
    there is no need to have routes back to the Titan Hub.

    If, for instance, you have an ELK stack in your Titan Hub and have actual EC2 instances in the DMZ layer which need
    to broadcast syslog traffic to the Hub, then it may be desirable to set this to `true`.

    In short, this value is easily determined by the following question: do hosts in the DMZ layer in this Titan
    Environment need to be able to route packets to the Titan Hub?
  EOF
}
