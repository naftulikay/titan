# Titan Network Module

locals {
  cidr_block = "10.${var.id}.0.0/16"
  zone = "${var.name_short}.${var.domain}"
}
