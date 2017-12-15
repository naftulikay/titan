# TITAN Layer Module - Network ACL Outputs

output "network_acl_id" {
  value = "${aws_network_acl.default.id}"

  description = <<-EOF
    The id of the network ACL shared by all subnets in this TITAN layer.
  EOF
}
