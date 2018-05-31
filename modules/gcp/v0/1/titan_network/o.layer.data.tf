# Titan Network Module - Data Layer Outputs

output "data_cidr_blocks" { value = ["${module.data_layer.cidr_blocks}"] }
output "data_container_range_cidr_blocks" { value = ["${module.data_layer.container_range_cidr_blocks}"] }
output "data_container_range_names" { value = ["${module.data_layer.container_range_names}"] }
output "data_gateway_addresses" { value = ["${module.data_layer.gateway_addresses}"] }
output "data_layer_index" { value = "${module.data_layer.layer_index}" }
output "data_management_range_cidr_blocks" { value = ["${module.data_layer.management_range_cidr_blocks}"] }
output "data_management_range_names" { value = ["${module.data_layer.management_range_names}"] }
output "data_subnet_ids" { value = ["${module.data_layer.subnet_ids}"] }
output "data_subnet_names" { value = ["${module.data_layer.subnet_names}"] }
