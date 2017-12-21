# Titan Environment Module - Outputs

output "hub_account_id" {
  value = "${coalesce(var.hub_account_id, module.network.account_id)}"

  description = <<-EOF
    The AWS account id in which the Titan Hub lives.
  EOF
}

output "hub_cidr_block" {
  value = "${var.hub_cidr_block}"

  description = <<-EOF
    The private IPv4 CIDR block of the Titan Hub.
  EOF
}

output "hub_ipv6_cidr_block" {
  value = "${var.hub_ipv6_cidr_block}"

  description = <<-EOF
    The IPv6 CIDR block of the Titan Hub.
  EOF
}

output "hub_name" {
  value = "${var.hub_name}"

  description = <<-EOF
    The Titan Network name of the Titan Hub.
  EOF
}

output "hub_vpc_id" {
  value = "${var.hub_vpc_id}"

  description = <<-EOF
    The VPC id of the Titan Hub.
  EOF
}

output "hub_zone" {
  value = "${var.hub_zone}"

  description = <<-EOF
    The hosted zone name of the Titan Hub.
  EOF
}

output "peering_include_public" {
  value = "${var.peering_include_public}"

  description = <<-EOF
    Whether public subnets have routes back to the Titan Hub.
  EOF
}
