# Single, Large-Sized (5 AZ) TITAN Network Example

provider "aws" {
  region = "us-east-1"
}

provider "template" {
  version = "~> 0.1"
}

terraform {
  backend "local" {
    path = "terraform.tfstate"
  }
}

module "network" {
  source = "../../../../modules/aws/v1/titan_network"
  network_id = 1
  name = "development"
  name_short = "dev"
  name_fancy = "TITAN Development Network"
  domain = "us-east-1.mycompany.com"
  subnets_per_layer = 5
}
