# Titan Network Module - Variables

variable name {
  description = <<-EOF
    Long name of the Titan network.

    This value serves as a unique identifier between different Titan networks and is used in tagging resources.

    Examples: `development`, `staging`, `production`.
  EOF
}

variable name_short {
  description = <<-EOF
    Short name of the Titan network.

    This value serves as the first segment of the DNS hosted zone for the given Titan network, e.g `dev.$${var.domain}`.

    Examples: `dev`, `stg`, `prod`.
  EOF
}

variable name_fancy {
  description = <<-EOF
    "Fancy" name for the Titan network.

    This value is used in formatting human-readable descriptions of resources related to the given Titan network.

    Examples: `Titan Development Environment`, `Titan Hub`, `Titan Staging Environment`,
    `Titan Production Environment`.
  EOF
}
