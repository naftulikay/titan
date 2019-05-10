# Titan Network Module - Layer Resources

module "dmz_layer" {
  source = "../titan_layer"

  layer_index = 0
  name = "dmz"
  network_id = "${var.id}"
  network_cidr_block = "${local.cidr_block}"
  network_name = "${var.name}"
  network_name_fancy = "${var.name_fancy}"
  vpc_id = "${google_compute_network.default.self_link}"
  region = "${var.region}"
  zone = "${local.zone}"
}

module "routing_layer" {
  source = "../titan_layer"

  layer_index = 1
  name = "routing"
  network_id = "${var.id}"
  network_cidr_block = "${local.cidr_block}"
  network_name = "${var.name}"
  network_name_fancy = "${var.name_fancy}"
  vpc_id = "${google_compute_network.default.self_link}"
  region = "${var.region}"
  zone = "${local.zone}"
}

module "services_layer" {
  source = "../titan_layer"

  layer_index = 2
  name = "services"
  network_id = "${var.id}"
  network_cidr_block = "${local.cidr_block}"
  network_name = "${google_compute_network.default.name}"
  network_name_fancy = "${var.name_fancy}"
  vpc_id = "${google_compute_network.default.self_link}"
  region = "${var.region}"
  zone = "${local.zone}"
}

module "data_layer" {
  source = "../titan_layer"

  layer_index = 3
  name = "data"
  network_id = "${var.id}"
  network_cidr_block = "${local.cidr_block}"
  network_name = "${var.name}"
  network_name_fancy = "${var.name_fancy}"
  vpc_id = "${google_compute_network.default.self_link}"
  region = "${var.region}"
  zone = "${local.zone}"
}

module "admin_layer" {
  source = "../titan_layer"

  layer_index = 4
  name = "admin"
  network_id = "${var.id}"
  network_cidr_block = "${local.cidr_block}"
  network_name = "${var.name}"
  network_name_fancy = "${var.name_fancy}"
  vpc_id = "${google_compute_network.default.self_link}"
  region = "${var.region}"
  zone = "${local.zone}"
}


