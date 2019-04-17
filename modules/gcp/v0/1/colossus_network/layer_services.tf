# Colossus Network Module - Services Layer Resources

module "services_layer" {
  source = "../colossus_layer"

  index = 2
  name = "services"
  name_fancy = "Services"
  network_cidr_block = "${local.cidr_block}"
  network_name_fancy = "${var.name_fancy}"
  region = "${data.google_client_config.default.region}"
  vpc_id = "${google_compute_network.default.self_link}"
  enable_flow_logs = "${var.enable_flow_logs}"
}

output "services_cidr_block"           { value = "${module.services_layer.cidr_block}" }
output "services_container_cidr_block" { value = "${module.services_layer.container_cidr_block}" }
output "services_container_range_name" { value = "${module.services_layer.container_range_name}" }
output "services_gateway_address"      { value = "${module.services_layer.gateway_address}" }
output "services_index"                { value = "${module.services_layer.index}" }
output "services_services_cidr_block"  { value = "${module.services_layer.services_cidr_block}" }
output "services_services_range_name"  { value = "${module.services_layer.services_range_name}" }
output "services_name"                 { value = "${module.services_layer.name}" }
output "services_name_fancy"           { value = "${module.services_layer.name_fancy}" }
output "services_subnet_id"            { value = "${module.services_layer.subnet_id}" }
