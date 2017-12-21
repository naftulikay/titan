# Titan Layer Module - Subnet Outputs

output "cidr_blocks" {
  value = ["${aws_subnet.default.*.cidr_block}"]

  description = <<-EOF
    A list of the IPv4 CIDR blocks for each subnet in this Titan layer.

    The length of this list will match the length of the `availability_zones` list variable and output, as one subnet
    is created per availability zone. Additionally, the first CIDR block in `cidr_blocks` will be in the first
    availability zone in `availability_zones`.
  EOF
}

output "cidr_mask_bits" {
  value = "${var.cidr_mask_bits}"

  description = <<-EOF
    Number of bits to extend per subnet into the host network's /16.
  EOF
}

output "cidr_start" {
  value = "${var.cidr_start}"

  description = <<-EOF
    The third IPv4 octet which subnets are sequentially numbered from.
  EOF
}

output "ipv6_cidr_block_association_ids" {
  # this is a bug in terraform documentation, docs say ipv6_association_id is the thing, it's not
  value = ["${aws_subnet.default.*.ipv6_cidr_block_association_id}"]

  description = <<-EOF
    A list of the IPv6 association ids for each subnet in this Titan layer.

    The length of this list will match the length of the `availability_zones` list variable and output, as one subnet
    is created per availability zone. Additionally, the first id in `ipv6_association_ids` will be in the first
    availability zone in `availability_zones`.
  EOF
}

output "ipv6_cidr_blocks" {
  value = ["${aws_subnet.default.*.ipv6_cidr_block}"]

  description = <<-EOF
    A list of IPv6 CIDR blocks for each subnet in this Titan layer.

    The length of this list will match the length of the `availability_zones` list variable and output, as one subnet
    is created per availability zone. Additionally, the first CIDR block in `ipv6_cidr_blocks` will be in the first
    availability zone in `availability_zones`.
  EOF
}

output "network_cidr_block" {
  value = "${var.network_cidr_block}"

  description = <<-EOF
    The IPv4 CIDR block of the host Titan network.
  EOF
}

output "network_ipv6_cidr_block" {
  value = "${var.network_ipv6_cidr_block}"

  description = <<-EOF
    The IPv6 CIDR block of the host Titan network.
  EOF
}

output "subnet_ids" {
  value = ["${aws_subnet.default.*.id}"]

  description = <<-EOF
    A list of the subnet ids which belong to this Titan layer.

    The length of this list will match the length of the `availability_zones` list variable and output, as one subnet
    is created per availability zone. Additionally, the first subnet in `subnet_ids` will be in the first availability
    zone in `availability_zones`.
  EOF
}
