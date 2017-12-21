# TITAN Environment Module - VPC Peering Resources

# Environments are said to "own" the VPC peering connection to its hub, so tagging is done accordingly

# VPC Peering Connection for Account-Local Hubs
resource "aws_vpc_peering_connection" "hub" {
  auto_accept = "${module.network.account_id == coalesce(var.hub_account_id, module.network.account_id)}"
  peer_vpc_id = "${var.hub_vpc_id}"
  vpc_id = "${module.network.vpc_id}"

  accepter {
    allow_remote_vpc_dns_resolution = true
  }

  requester {
    allow_remote_vpc_dns_resolution = true
  }

  tags {
    Name = "${module.network.zone}:${var.hub_zone} Peering Connection"
    titan_network = "${module.network.name}"
    titan_zone = "${module.network.zone}"
    titan_hub = "${var.hub_name}"
    titan_hub_zone = "${var.hub_zone}"
  }
}

resource "aws_vpc_peering_connection_accepter" "hub" {
  # only create if cross-account
  count = "${module.network.account_id == coalesce(var.hub_account_id, module.network.account_id) ? 0 : 1}"

  vpc_peering_connection_id = "${aws_vpc_peering_connection.hub.id}"
  auto_accept = true

  tags {
    Name = "${module.network.zone}:${var.hub_zone} Peering Connection"
    titan_network = "${module.network.name}"
    titan_zone = "${module.network.zone}"
    titan_hub = "${var.hub_name}"
    titan_hub_zone = "${var.hub_zone}"
  }
}
