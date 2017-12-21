# Titan Layer Module Template Outputs File for Projects

output "availability_zones" { value = "${module.layer.availability_zones}" }
output "cidr_blocks" { value = "${module.layer.cidr_blocks}" }
output "cidr_mask_bits" { value = "${module.layer.cidr_mask_bits}" }
output "cidr_start" { value = "${module.layer.cidr_start}" }
output "egress_only_gateway_id" { value = "${module.layer.egress_only_gateway_id}" }
output "internet_gateway_id" { value = "${module.layer.internet_gateway_id}" }
output "ipv6_cidr_block_association_ids" { value = "${module.layer.ipv6_cidr_block_association_ids}" }
output "ipv6_cidr_blocks" { value = "${module.layer.ipv6_cidr_blocks}" }
output "is_public" { value = "${module.layer.is_public}" }
output "name" { value = "${module.layer.name}" }
output "nat_gateway_ids" { value = "${module.layer.nat_gateway_ids}" }
output "network_acl_id" { value = "${module.layer.network_acl_id}" }
output "network_cidr_block" { value = "${module.layer.network_cidr_block}" }
output "network_ipv6_cidr_block" { value = "${module.layer.network_ipv6_cidr_block}" }
output "network_name" { value = "${module.layer.network_name}" }
output "route_table_ids" { value = "${module.layer.route_table_ids}" }
output "subnet_ids" { value = "${module.layer.subnet_ids}" }
output "vpc_id" { value = "${module.layer.vpc_id}" }
output "zone" { value = "${module.layer.zone}" }
