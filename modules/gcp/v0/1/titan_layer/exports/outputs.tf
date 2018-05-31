# Titan Layer Module Template Outputs File for Projects

output "layer_cidr_blocks" { value = ["${module.layer.cidr_blocks}"] }
output "layer_container_range_cidr_blocks" { value = ["${module.layer.container_range_cidr_blocks}"] }
output "layer_container_range_names" { value = ["${module.layer.container_range_names}"] }
output "layer_gateway_addresses" { value = ["${module.layer.gateway_addresses}"] }
output "layer_layer_index" { value = "${module.layer.layer_index}" }
output "layer_management_range_cidr_blocks" { value =["${module.layer.management_range_cidr_blocks}"] }
output "layer_management_range_names" { value = ["${module.layer.management_range_names}"] }
output "layer_name" { value = "${module.layer.name}" }
output "layer_network_cidr_block" { value = "${module.layer.network_cidr_block}"}
output "layer_network_id" { value = "${module.layer.network_id}" }
output "layer_network_name" { value = "${module.layer.network_name}" }
output "layer_network_name_fancy" { value = "${module.layer.network_name_fancy}" }
output "layer_region" { value = "${module.layer.region}" }
output "layer_subnet_ids" { value = ["${module.layer.subnet_ids}"] }
output "layer_subnet_names" { value = ["${module.layer.subnet_names}"] }
output "layer_vpc_id" { value = "${module.layer.vpc_id}" }
output "layer_zone" { value = "${module.layer.zone}" }
