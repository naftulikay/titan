# Titan Layer Module - Variables

variable "availability_zones" {
  type = "list"

  description = <<-EOF
    A list of availability zones to distribute subnets along.
  EOF
}

variable "is_public" {
  default = false

  description = <<-EOF
    Does this layer face WAN, or is it private?

    Default: false.
  EOF
}

variable "name" {
  description = <<-EOF
    The name of this Titan layer.
  EOF
}

variable "network_name" {
  description = <<-EOF
    The name of the Titan Network to which this layer belongs.
  EOF
}

variable "vpc_id" {
  description = <<-EOF
    The VPC id of the Titan network owning this Titan layer.
  EOF
}

variable "zone" {
  description = <<-EOF
    The hosted zone of the Titan Network to which this layer belongs.
  EOF
}
