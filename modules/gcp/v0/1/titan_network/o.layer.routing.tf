# Titan Network Module - Routing Layer Outputs

output "routing_cidr_blocks" { value = ["${module.routing_layer.cidr_blocks}"] }
output "routing_container_range_cidr_blocks" { value = ["${module.routing_layer.container_range_cidr_blocks}"] }
output "routing_container_range_names" { value = ["${module.routing_layer.container_range_names}"] }
output "routing_gateway_addresses" { value = ["${module.routing_layer.gateway_addresses}"] }
output "routing_layer_index" { value = "${module.routing_layer.layer_index}" }
output "routing_management_range_cidr_blocks" { value = ["${module.routing_layer.management_range_cidr_blocks}"] }
output "routing_management_range_names" { value = ["${module.routing_layer.management_range_names}"] }
output "routing_subnet_ids" { value = ["${module.routing_layer.subnet_ids}"] }
output "routing_subnet_names" { value = ["${module.routing_layer.subnet_names}"] }
