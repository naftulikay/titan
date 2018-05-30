# Small Titan Network Example for GCP

provider "google" {
  project = "naftuli-test"
  region = "us-east1"
}

module "network" {
  source = "../../../../../modules/gcp/v0/1/titan_network"
  region = "us-east1"

  id = "0"

  domain = "cloud.naftuli.wtf"

  name = "development"
  name_short = "dev"
  name_fancy = "Development"

  nat_additional_ssh_cidr_blocks = ["0.0.0.0/0"]
  nat_additional_startup_script = "${file("${path.module}/init.sh")}"
}

data "google_compute_zones" "available" {}

resource "google_compute_instance" "admin" {
  count = 3

  name = "nat-test-${count.index}"
  machine_type = "g1-small"
  zone = "${data.google_compute_zones.available.names[count.index]}"

  boot_disk {
    initialize_params {
      image = "centos-cloud/centos-7"
    }
  }

  network_interface {
    subnetwork = "${module.network.admin_subnet_ids[count.index]}"
  }

  allow_stopping_for_update = true
  metadata = {}
  metadata_startup_script = "${file("${path.module}/init.sh")}"

  tags = ["no-ip", "nat", "private", "internal-ssh"]
}

resource "google_compute_firewall" "default" {
  name = "internal-ssh"
  network = "${module.network.vpc_id}"

  allow {
    protocol = "tcp"
    ports = ["22"]
  }

  source_ranges = ["${module.network.cidr_block}"]
  target_tags = ["internal-ssh"]
}
