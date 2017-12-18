# TITAN Environment Module - VPC Peering Outputs

output "hub_peering_connection_id" {
  value = "${aws_vpc_peering_connection.hub.id}"

  description = <<-EOF
    The VPC Peering Connection id of the peering connection to the TITAN Hub.
  EOF
}
