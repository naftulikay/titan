# Colossus Network Module

This module is the base Colossus Network implementation for Google Cloud.

## Resources

### `google_dns_managed_zone.public`

The public hosted zone for the network.

#### Resource Outputs

 - `id`: the unique ID for this resource
 - `name_servers[]`: a list of Google nameservers for this public hosted zone.

### `google_compute_network.default`

The network itself.

#### Resource Outputs

 - `gateway_ipv4`: the IPv4 address of the default gateway for the network.
 - `name`: the unique name of the network.
 - `self_link`: the unique VPC identifier.

### `google_compute_route.public`

The default public route to the internet for instances in the DMZ layer.

#### Resource Outputs

 - `self_link`: the unique route identifier.
