# TITAN Network Module - Outputs

output "account_id" {
  value = "${data.aws_caller_identity.default.account_id}"

  description = <<-EOF
    The AWS account id in which this TITAN network lives.
  EOF
}

output "availability_zones" {
  value = ["${slice(data.aws_availability_zones.default.names, 0, var.subnets_per_layer)}"]

  description = <<-EOF
    The availability zones which this TITAN network occupies. The length of this list is set by the `subnets_per_layer`
    variable.
  EOF
}

output "name" {
  value = "${var.name}"

  description = <<-EOF
    Long name of the TITAN network.
  EOF
}

output "name_fancy" {
  value = "${var.name_fancy}"

  description = <<-EOF
    "Fancy" name for the TITAN network.
  EOF
}

output "name_short" {
  value = "${var.name_short}"

  description = <<-EOF
    Short name of the TITAN network.
  EOF
}

output "region" {
  value = "${data.aws_region.default.name}"

  description = <<-EOF
    The AWS region in which this TITAN network lives.
  EOF
}
