# Titan Network Module - Services Layer Outputs

output "services_cidr_blocks" { value = ["${module.services_layer.cidr_blocks}"] }
output "services_container_range_cidr_blocks" { value = ["${module.services_layer.container_range_cidr_blocks}"] }
output "services_container_range_names" { value = ["${module.services_layer.container_range_names}"] }
output "services_gateway_addresses" { value = ["${module.services_layer.gateway_addresses}"] }
output "services_layer_index" { value = "${module.services_layer.layer_index}" }
output "services_management_range_cidr_blocks" { value = ["${module.services_layer.management_range_cidr_blocks}"] }
output "services_management_range_names" { value = ["${module.services_layer.management_range_names}"] }
output "services_subnet_ids" { value = ["${module.services_layer.subnet_ids}"] }
output "services_subnet_names" { value = ["${module.services_layer.subnet_names}"] }
