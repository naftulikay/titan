# Colossus NAT Module - Instance Template Resources

data "template_file" "instance_startup_script" {
  template = "${file("${path.module}/templates/startup.sh.tpl")}"
}

variable "instance_type" { default = "n1-standard-2" }

resource "google_compute_instance_template" "primary" {
  count = "${length(local.availability_zones)}"

  name_prefix = "nat-0-${element(split("-", local.availability_zones[count.index]), 2)}"
  description = "Colossus Primary NAT Gateway Instance Template in ${local.availability_zones[count.index]}."

  machine_type = "${var.instance_type}"
  can_ip_forward = true

  disk {
    auto_delete = true
    boot = true
    source_image = "${local.instance_image}"
    type = "PERSISTENT"
    disk_type = "pd-standard"
    disk_size_gb = "32"
    mode = "READ_WRITE"
  }

  network_interface {
    subnetwork = "${var.dmz_subnet_id}"
    network_ip = "${element(google_compute_address.private_primary.*.address, count.index)}"
    access_config {
      nat_ip = "${element(google_compute_address.public_primary.*.address, count.index)}"
    }
  }

  scheduling {
    automatic_restart = true
    on_host_maintenance = "MIGRATE"
    preemptible = false
  }

  metadata = "${local.instance_metadata}"
  tags = "${local.instance_tags}"
  labels = "${local.instance_labels}"

  lifecycle {
    create_before_destroy = true
  }
}

resource "google_compute_instance_template" "secondary" {
  count = "${var.zonal_high_availability ? length(local.availability_zones) : 0}"

  name_prefix = "nat-1-${element(split("-", local.availability_zones[count.index]), 2)}"
  description = "Colossus Secondary NAT Gateway Instance Template in ${local.availability_zones[count.index]}."

  machine_type = "${var.instance_type}"
  can_ip_forward = true

  disk {
    auto_delete = true
    boot = true
    source_image = "${local.instance_image}"
    type = "PERSISTENT"
    disk_type = "pd-standard"
    disk_size_gb = "32"
    mode = "READ_WRITE"
  }

  network_interface {
    subnetwork = "${var.dmz_subnet_id}"
    network_ip = "${element(google_compute_address.private_secondary.*.address, count.index)}"
    access_config {
      nat_ip = "${element(google_compute_address.public_secondary.*.address, count.index)}"
    }
  }

  scheduling {
    automatic_restart = true
    on_host_maintenance = "MIGRATE"
    preemptible = false
  }

  metadata = "${local.instance_metadata}"
  tags = "${local.instance_tags}"
  labels = "${local.instance_labels}"

  depends_on = ["google_compute_instance_template.primary"]

  lifecycle {
    create_before_destroy = true
  }
}
