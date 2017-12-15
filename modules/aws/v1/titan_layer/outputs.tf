# TITAN Layer Module - Outputs

output "availability_zones" {
  value = ["${var.availability_zones}"]

  description = <<-EOF
    The availability zones supported by the subnets in this TITAN layer.
  EOF
}

output "is_public" {
  value = "${var.is_public}"

  description = <<-EOF
    Whether the layer is public-facing or is private behind NAT.
  EOF
}

output "name" {
  value = "${var.name}"

  description = <<-EOF
    The name of this TITAN layer.
  EOF
}

output "network_name" {
  value = "${var.network_name}"

  description = <<-EOF
    The name of the TITAN Network to which this layer belongs.
  EOF
}

output "vpc_id" {
  value = "${var.vpc_id}"

  description = <<-EOF
    The VPC id of the TITAN network owning this TITAN layer.
  EOF
}

output "zone" {
  value = "${var.zone}"

  description = <<-EOF
    The hosted zone of the TITAN Network to which this layer belongs.
  EOF
}
