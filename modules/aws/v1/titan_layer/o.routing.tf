# TITAN Layer Module - Routing Outputs

output "egress_only_gateway_id" {
  value = "${var.egress_only_gateway_id}"

  description = <<-EOF
    The Egress-Only Internet Gateway id for the host TITAN network.

    This will be undefined for public layers.
  EOF
}

output "internet_gateway_id" {
  value = "${var.internet_gateway_id}"

  description = <<-EOF
    The Internet Gateway id for the host TITAN network.

    This will be undefined for private layers.
  EOF
}

output "nat_gateway_ids" {
  value = ["${var.nat_gateway_ids}"]

  description = <<-EOF
    A list of NAT Gateway ids, one per availability zone, of the host TITAN network.

    This will be undefined for public layers.
  EOF
}

output "route_table_ids" {
  value = ["${aws_route_table.default.*.id}"]

  description = <<-EOF
    A list of route table ids for each subnet in this TITAN layer.

    The length of this list will match the length of the `availability_zones` list variable and output, as one subnet
    is created per availability zone. Additionally, the first route table in `route_table_ids` will target the subnet
    in the first availability zone in `availability_zones`.
  EOF
}
