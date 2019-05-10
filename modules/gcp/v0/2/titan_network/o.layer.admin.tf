# Titan Network Module - Admin Layer Outputs

output "admin_cidr_blocks" { value = ["${module.admin_layer.cidr_blocks}"] }
output "admin_container_range_cidr_blocks" { value = ["${module.admin_layer.container_range_cidr_blocks}"] }
output "admin_container_range_names" { value = ["${module.admin_layer.container_range_names}"] }
output "admin_gateway_addresses" { value = ["${module.admin_layer.gateway_addresses}"] }
output "admin_layer_index" { value = "${module.admin_layer.layer_index}" }
output "admin_management_range_cidr_blocks" { value = ["${module.admin_layer.management_range_cidr_blocks}"] }
output "admin_management_range_names" { value = ["${module.admin_layer.management_range_names}"] }
output "admin_subnet_ids" { value = ["${module.admin_layer.subnet_ids}"] }
output "admin_subnet_names" { value = ["${module.admin_layer.subnet_names}"] }
