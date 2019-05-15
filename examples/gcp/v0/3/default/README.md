# GCP Default Example

This example simply builds a default size (3 AZ, 3 NAT Gateway instances) Titan network for GCP for the initial
release of Titan for Google Cloud.

NAT instances will install my public keys and a user, alongside three `nat-test` instances in the admin layer. These
instances exist to prove the ability to:

 1. reach the internet directly for `public` hosts such as the NAT Gateways
 1. use NAT gateways as bastion hosts to reach private hosts in the network.
 2. reach WAN via a NAT gateway from the private hosts in the network.

Replace my user and SSH keys with yours and spin up this example to test out these aspects of Titan.
