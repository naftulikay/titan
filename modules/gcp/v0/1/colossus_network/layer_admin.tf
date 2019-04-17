# Colossus Network Module - Admin Layer Resources

module "admin_layer" {
  source = "../colossus_layer"

  index = 4
  name = "admin"
  name_fancy = "Admin"
  network_cidr_block = "${local.cidr_block}"
  network_name_fancy = "${var.name_fancy}"
  region = "${data.google_client_config.default.region}"
  vpc_id = "${google_compute_network.default.self_link}"
  enable_flow_logs = "${var.enable_flow_logs}"
}

output "admin_cidr_block"           { value = "${module.admin_layer.cidr_block}" }
output "admin_container_cidr_block" { value = "${module.admin_layer.container_cidr_block}" }
output "admin_container_range_name" { value = "${module.admin_layer.container_range_name}" }
output "admin_gateway_address"      { value = "${module.admin_layer.gateway_address}" }
output "admin_index"                { value = "${module.admin_layer.index}" }
output "admin_services_cidr_block"  { value = "${module.admin_layer.services_cidr_block}" }
output "admin_services_range_name"  { value = "${module.admin_layer.services_range_name}" }
output "admin_name"                 { value = "${module.admin_layer.name}" }
output "admin_name_fancy"           { value = "${module.admin_layer.name_fancy}" }
output "admin_subnet_id"            { value = "${module.admin_layer.subnet_id}" }
