# Titan Network Module - VPC Endpoint Outputs

output s3_vpce_id {
  value = aws_vpc_endpoint.s3.id

  description = <<-EOF
    The VPC Endpoint identifier for the S3 gateway.
  EOF
}

output s3_vpce_prefix_list_id {
  value = aws_vpc_endpoint.s3.prefix_list_id

  description = <<-EOF
    The VPC Endpoint prefix list identifier for the S3 gateway.
  EOF
}

output s3_vpce_cidr_blocks {
  value = aws_vpc_endpoint.s3.cidr_blocks

  description = <<-EOF
    The IPv4 CIDR blocks for the S3 VPC Endpoint.
  EOF
}
