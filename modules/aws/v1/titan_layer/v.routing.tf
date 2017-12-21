# Titan Layer Module - Routing Variables

variable "egress_only_gateway_id" {
  default = ""

  description = <<-EOF
    The Egress-Only Internet Gateway of the Titan network owning this layer.

    This value is required for private layers and ignored for public layers.
  EOF
}

variable "internet_gateway_id" {
  default = ""

  description = <<-EOF
    The Internet Gateway id of the Titan network owning this layer.

    This value is required for public layers and ignored for private layers.
  EOF
}

variable "nat_gateway_ids" {
  type = "list"
  default = ["null"] # mandated by parser

  description = <<-EOF
    A list of NAT Gateway ids, one per availability zone, of the Titan network owning this layer.

    This value is required for private layers and ignored for public layers.
  EOF
}
