# Titan Layer Module - Variables

variable "name" {
  description = <<-EOF
    The name of the Titan Layer.
  EOF
}

variable "network_cidr_block" {
  description = <<-EOF
    The CIDR block of the parent Titan network.
  EOF
}

variable "network_id" {
  description = <<-EOF
    The 0-255 second octet identifier for the parent Titan network.
  EOF
}

variable "network_name" {
  description = <<-EOF
    The name of the parent Titan Network.
  EOF
}

variable "network_name_fancy" {
  description = <<-EOF
    The fancy name of the parent Titan Network.
  EOF
}

variable "region" {
  description = <<-EOF
    The GCP region which the parent Titan Network lives in.
  EOF
}

variable "vpc_id" {
  description = <<-EOF
    The self-link to the parent network for this Titan Layer.
  EOF
}

variable "zone" {
  description = <<-EOF
    The hosted zone for the parent Titan network.
  EOF
}
