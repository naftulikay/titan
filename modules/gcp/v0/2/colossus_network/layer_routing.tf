# Colossus Network Module - Routing Layer Resources

module "routing_layer" {
  source = "../colossus_layer"

  index = 1
  name = "routing"
  name_fancy = "Routing"
  network_cidr_block = "${local.cidr_block}"
  network_name_fancy = "${var.name_fancy}"
  region = "${data.google_client_config.default.region}"
  vpc_id = "${google_compute_network.default.self_link}"
  enable_flow_logs = "${var.enable_flow_logs}"
}

output "routing_cidr_block"           { value = "${module.routing_layer.cidr_block}" }
output "routing_container_cidr_block" { value = "${module.routing_layer.container_cidr_block}" }
output "routing_container_range_name" { value = "${module.routing_layer.container_range_name}" }
output "routing_gateway_address"      { value = "${module.routing_layer.gateway_address}" }
output "routing_index"                { value = "${module.routing_layer.index}" }
output "routing_services_cidr_block"  { value = "${module.routing_layer.services_cidr_block}" }
output "routing_services_range_name"  { value = "${module.routing_layer.services_range_name}" }
output "routing_name"                 { value = "${module.routing_layer.name}" }
output "routing_name_fancy"           { value = "${module.routing_layer.name_fancy}" }
output "routing_subnet_id"            { value = "${module.routing_layer.subnet_id}" }
