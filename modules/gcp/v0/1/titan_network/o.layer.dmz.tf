# Titan Network Module - DMZ Layer Outputs

output "dmz_cidr_blocks" { value = ["${module.dmz_layer.cidr_blocks}"] }
output "dmz_container_range_cidr_blocks" { value = ["${module.dmz_layer.container_range_cidr_blocks}"] }
output "dmz_container_range_names" { value = ["${module.dmz_layer.container_range_names}"] }
output "dmz_gateway_addresses" { value = ["${module.dmz_layer.gateway_addresses}"] }
output "dmz_layer_index" { value = "${module.dmz_layer.layer_index}" }
output "dmz_management_range_cidr_blocks" { value = ["${module.dmz_layer.management_range_cidr_blocks}"] }
output "dmz_management_range_names" { value = ["${module.dmz_layer.management_range_names}"] }
output "dmz_subnet_ids" { value = ["${module.dmz_layer.subnet_ids}"] }
output "dmz_subnet_names" { value = ["${module.dmz_layer.subnet_names}"] }
