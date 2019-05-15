# Static Instances Demo Resources

resource "google_compute_instance" "admin" {
  count = "${length(data.google_compute_zones.available.names)}"

  name = "admin-${count.index}"
  machine_type = "g1-small"
  zone = "${data.google_compute_zones.available.names[count.index]}"

  boot_disk {
    initialize_params {
      image = "centos-cloud/centos-7"
    }
  }

  network_interface {
    subnetwork = "${module.network.admin_subnet_id}"
  }

  allow_stopping_for_update = true
  metadata = {}
  metadata_startup_script = "${file("${path.module}/startup.sh")}"
  tags = ["nat", "internal-ssh", "colossus-admin"]
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
