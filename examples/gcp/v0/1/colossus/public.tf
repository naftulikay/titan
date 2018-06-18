# Public Bastion Host Demo

resource "google_compute_address" "bastion" {
  name = "bastion"
  address_type = "EXTERNAL"
}

output "bastion" { value = "${google_compute_address.bastion.address}" }

resource "google_compute_instance" "bastion" {
  name = "bastion"
  machine_type = "g1-small"
  zone = "${data.google_compute_zones.available.names[0]}"

  boot_disk {
    initialize_params {
      image = "centos-cloud/centos-7"
    }
  }

  network_interface {
    subnetwork = "${module.network.dmz_subnet_id}"
    access_config {
      nat_ip = "${google_compute_address.bastion.address}"
    }
  }

  allow_stopping_for_update = true
  metadata = {}
  metadata_startup_script = "${file("${path.module}/startup.sh")}"

  tags = ["bastion", "public", "colossus-dmz"]

  depends_on = ["module.network"]
}

resource "google_compute_firewall" "bastion" {
  name = "bastion"
  network = "${module.network.vpc_id}"

  allow {
    protocol = "tcp"
    ports = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags = ["bastion"]
}
