# Titan Layer Module - Outputs

output availability_zones {
  value = var.availability_zones

  description = <<-EOF
    The availability zones supported by the subnets in this Titan layer.
  EOF
}

output is_public {
  value = var.is_public

  description = <<-EOF
    Whether the layer is public-facing or is private behind NAT.
  EOF
}

output name {
  value = var.name

  description = <<-EOF
    The name of this Titan layer.
  EOF
}

output network_name {
  value = var.network_name

  description = <<-EOF
    The name of the Titan Network to which this layer belongs.
  EOF
}

output vpc_id {
  value = var.vpc_id

  description = <<-EOF
    The VPC id of the Titan network owning this Titan layer.
  EOF
}

output zone {
  value = var.zone

  description = <<-EOF
    The hosted zone of the Titan Network to which this layer belongs.
  EOF
}
