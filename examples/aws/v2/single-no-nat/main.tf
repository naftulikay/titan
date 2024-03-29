# Single, Small-Sized (1 AZ) Titan Network Example

provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "local" {
    path = "terraform.tfstate"
  }
}

module "network" {
  source = "../../../../modules/aws/v2/titan_network"
  network_id = 1
  name = "development"
  name_short = "dev"
  name_fancy = "Titan Development Network"
  nat_enabled = false
  domain = "us-east-1.mycompany.com"
  subnets_per_layer = 1
}
