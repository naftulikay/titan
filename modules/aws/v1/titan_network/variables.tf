# TITAN Network Module - Variables

variable "name" {
  description = <<-EOF
    Long name of the TITAN network.

    This value serves as a unique identifier between different TITAN networks and is used in tagging resources.

    Examples: `development`, `staging`, `production`.
  EOF
}

variable "name_short" {
  description = <<-EOF
    Short name of the TITAN network.

    This value serves as the first segment of the DNS hosted zone for the given TITAN network, e.g `dev.${var.domain}`.

    Examples: `dev`, `stg`, `prod`.
  EOF
}

variable "name_fancy" {
  description = <<-EOF
    "Fancy" name for the TITAN network.

    This value is used in formatting human-readable descriptions of resources related to the given TITAN network.

    Examples: `TITAN Development Environment`, `TITAN Hub`, `TITAN Staging Environment`,
    `TITAN Production Environment`.
  EOF
}
