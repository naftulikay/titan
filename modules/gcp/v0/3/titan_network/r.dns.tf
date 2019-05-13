# Titan NAT Module - DNS Resources

resource "google_dns_managed_zone" "public" {
  name = "titan-${var.name_short}-public"
  dns_name = "${local.zone}."
  description = "Public Hosted Zone for the Titan ${var.name_fancy} Network."
}
