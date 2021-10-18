# Titan Network Module - Route 53 Outputs

output delegation_set_id {
  value = aws_route53_delegation_set.default.id

  description = <<-EOF
    Unique identifier for the Route 53 delegation set associated with the public Route 53 hosted zone for this Titan
    network.

    See: https://www.terraform.io/docs/providers/aws/r/route53_delegation_set.html
  EOF
}

output delegation_set_name_servers {
  value = aws_route53_delegation_set.default.name_servers

  description = <<-EOF
    A set of Amazon name servers serving the public Route 53 hosted zone for this Titan network.

    Typically, these values are used with your DNS provider to delegate public DNS resolution for this Titan network.

    See: https://www.terraform.io/docs/providers/aws/r/route53_delegation_set.html
  EOF
}

output domain {
  value = var.domain

  description = <<-EOF
    Value of the `domain` variable exported for usability.

    Note that this is not a FQDN ending with a period.
  EOF
}

output private_zone_id {
  value = aws_route53_zone.private.zone_id

  description = <<-EOF
    The Amazon hosted zone identifier for the private Route 53 hosted zone for this Titan network.

    See: https://www.terraform.io/docs/providers/aws/r/route53_zone.html
  EOF
}

output public_zone_id {
  value = aws_route53_zone.public.zone_id

  description = <<-EOF
    The Amazon hosted zone identifier for the public Route 53 hosted zone for this Titan network.

    See: https://www.terraform.io/docs/providers/aws/r/route53_zone.html
  EOF
}

output reverse_zone {
  value = "${var.network_id}.10.in-addr.arpa"

  description = <<-EOF
    The reverse hosted zone name for this Titan network.

    Note that this is not a FQDN ending with a period.
  EOF
}

output reverse_zone_id {
  value = aws_route53_zone.reverse.zone_id

  description = <<-EOF
    The Amazon hosted zone identifier for the reverse Route 53 hosted zone for this Titan network.

    See: https://www.terraform.io/docs/providers/aws/r/route53_zone.html
  EOF
}

output zone {
  value = "${var.name_short}.${var.domain}"

  description = <<-EOF
    The hosted zone domain name for this Titan network.

    Note that this is not a FQDN ending with a period.
  EOF
}
