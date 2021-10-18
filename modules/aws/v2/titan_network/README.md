# Titan Network Module

This module contains the skeleton of a Titan network.

In object-oriented language, this serves as the abstract superclass of Titan environments and Titan hubs. All shared
resources are declared here and extended as appropriate in the Titan Environment module and the Titan Hub module.

For more information on these modules, please see each module's README.

> **NOTE:** When growing a Titan Network, NAT Gateways will need to be destroyed and recreated. This is due to a limitation
> in `terraform plan`; we handle it by using `lifecycle.create_before_destroy = true` on these resources so that no NAT
> interruptions occur during the provision. Do be advised that elastic IP addresses are recreated during this process
> as well, so if you're referencing the NAT EIPs somewhere, these will change during provision.

## Modules

### `module.dmz_layer`

### `module.routing_layer`

### `module.service_layer`

### `module.data_layer`

### `module.admin_layer`

### `module.net_layer`

## Resources

### `aws_nat_gateway.default`

### `aws_eip.nat`

### `aws_default_network_acl.default`

### `aws_route53aws_route53_delegation_set.default`

### `aws_route53_zone.public`

### `aws_route53_zone.private`

### `aws_route53_zone.reverse`

### `aws_default_route_table.default`

### `aws_default_security_group.default`

### `aws_security_group.ssh`

### `aws_sns_topic.autoscaling`

### `aws_vpc.default`

### `aws_vpc_dhcp_options.default`

### `aws_vpc_dhcp_options_association`

### `aws_internet_gateway.default`

### `aws_egress_only_internet_gateway.default`

### `aws_vpc_endpoint.s3`

## Variables

### `domain`

### `domain_name_servers`

### `instance_tenancy`

### `netbios_name_servers`

### `netbios_node_type`

### `network_id`

### `ntp_servers`

### `subnets_per_layer`

### `name`

### `name_short`

### `name_fancy`

## Outputs
