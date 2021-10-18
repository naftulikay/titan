# Single Environment, Single Hub Example

provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "local" {
    path = "terraform.tfstate"
  }
}

# The central Titan Hub which all Titan Environments are peered to
module "hub" {
  source = "../../../../modules/aws/v1/titan_hub"
  network_id = 100
  name = "hub1"
  name_short = "hub1"
  name_fancy = "Titan Development Network"
  domain = "us-east-1.mycompany.com"
  subnets_per_layer = 3
}

# The "Development" Titan Environment
module "environment" {
  source = "../../../../modules/aws/v1/titan_environment"
  network_id = 1
  name = "development"
  name_short = "dev"
  name_fancy = "Titan Development Network"
  domain = "us-east-1.mycompany.com"
  subnets_per_layer = 3

  hub_cidr_block = module.hub.cidr_block
  hub_ipv6_cidr_block = module.hub.ipv6_cidr_block
  hub_name = module.hub.name
  hub_vpc_id = module.hub.vpc_id
  hub_zone = module.hub.zone
}

# Internal Routes from the Titan Hub back to the "Development" Titan Environment
resource aws_route dev_ipv4 {
  # FIXME due to cross-module issues: "value of 'count' cannot be computed," we have to calculate this"
  count = 3 * 5

  destination_cidr_block = module.environment.cidr_block
  route_table_id = module.hub.private_route_table_ids[count.index]
  vpc_peering_connection_id = module.environment.hub_peering_connection_id
}

resource aws_route dev_ipv6 {
    # FIXME due to cross-module issues: "value of 'count' cannot be computed," we have to calculate this"
  count = 3 * 5

  destination_ipv6_cidr_block = module.environment.ipv6_cidr_block
  route_table_id = module.hub.private_route_table_ids[count.index]
  vpc_peering_connection_id = module.environment.hub_peering_connection_id
}
