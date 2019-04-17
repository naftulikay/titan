# Colossus Network Module - DMZ Layer Resources

module "dmz_layer" {
  source = "../colossus_layer"

  index = 0
  name = "dmz"
  name_fancy = "DMZ"
  network_cidr_block = "${local.cidr_block}"
  network_name_fancy = "${var.name_fancy}"
  region = "${data.google_client_config.default.region}"
  vpc_id = "${google_compute_network.default.self_link}"
  enable_flow_logs = "${var.enable_flow_logs}"
}

output "dmz_cidr_block"           { value = "${module.dmz_layer.cidr_block}" }
output "dmz_container_cidr_block" { value = "${module.dmz_layer.container_cidr_block}" }
output "dmz_container_range_name" { value = "${module.dmz_layer.container_range_name}" }
output "dmz_gateway_address"      { value = "${module.dmz_layer.gateway_address}" }
output "dmz_index"                { value = "${module.dmz_layer.index}" }
output "dmz_services_cidr_block"  { value = "${module.dmz_layer.services_cidr_block}" }
output "dmz_services_range_name"  { value = "${module.dmz_layer.services_range_name}" }
output "dmz_name"                 { value = "${module.dmz_layer.name}" }
output "dmz_name_fancy"           { value = "${module.dmz_layer.name_fancy}" }
output "dmz_subnet_id"            { value = "${module.dmz_layer.subnet_id}" }
