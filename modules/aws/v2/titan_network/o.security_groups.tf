# Titan Network Module - Security Group Outputs

output default_security_group_id {
  value = aws_vpc.default.default_security_group_id

  description = <<-EOF
    The default security group ID for this Titan network's VPC.

    See: https://www.terraform.io/docs/providers/aws/r/vpc.html
  EOF
}

output internal_ssh_sg_id {
  value = aws_security_group.ssh.id

  description = <<-EOF
    Security group ID of the internal SSH security group for this Titan network.
  EOF
}
