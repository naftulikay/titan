# Colossus Network Module - Data Layer Resources

module "data_layer" {
  source = "../colossus_layer"

  index = 3
  name = "data"
  name_fancy = "Data"
  network_cidr_block = "${local.cidr_block}"
  network_name_fancy = "${var.name_fancy}"
  region = "${data.google_client_config.default.region}"
  vpc_id = "${google_compute_network.default.self_link}"
  enable_flow_logs = "${var.enable_flow_logs}"
}

output "data_cidr_block"           { value = "${module.data_layer.cidr_block}" }
output "data_container_cidr_block" { value = "${module.data_layer.container_cidr_block}" }
output "data_container_range_name" { value = "${module.data_layer.container_range_name}" }
output "data_gateway_address"      { value = "${module.data_layer.gateway_address}" }
output "data_index"                { value = "${module.data_layer.index}" }
output "data_services_cidr_block"  { value = "${module.data_layer.services_cidr_block}" }
output "data_services_range_name"  { value = "${module.data_layer.services_range_name}" }
output "data_name"                 { value = "${module.data_layer.name}" }
output "data_name_fancy"           { value = "${module.data_layer.name_fancy}" }
output "data_subnet_id"            { value = "${module.data_layer.subnet_id}" }
