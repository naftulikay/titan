# Titan Layer Module - Subnet Variables

variable cidr_mask_bits {
  default = "7"

  description = <<-EOF
    Number of bits to extend per subnet into the host network's /16.

    This is kind of a confusing value, but to make things easy, only 7 and 8 are supported and result in a /23 and a
    /24, respectively. This is used with the `cidrsubnet()` configuration function as the `newbits` parameter.

    Default: 7, yielding up to 512 addresses per subnet in the layer.

    See: https://www.terraform.io/docs/configuration/interpolation.html#cidrsubnet-iprange-newbits-netnum-
  EOF
}

variable cidr_start {
  description = <<-EOF
    The third IPv4 octet to begin numbering layer subnets from.

    Generally, to accommodate up to 5 availability zones per layer at /23 subnet size, this value should be a multiple
    of ten, e.g. `0`, `10`, `20`, etc. This is used with the `cidrsubnet()` configuration function as the `netnum`
    parameter.

    See: https://www.terraform.io/docs/configuration/interpolation.html#cidrsubnet-iprange-newbits-netnum-
  EOF
}

variable network_cidr_block {
  description = <<-EOF
    The IPv4 CIDR block of the host Titan network.

    This should always be a /16.
  EOF
}

variable network_ipv6_cidr_block {
  description = <<-EOF
    The IPv6 CIDR block for the host Titan network.

    This should always be a /56.
  EOF
}
