# Titan NAT Module - Instance Template Resources

data "template_file" "instance_startup_script" {
  # use either the specified startup script template or the built in one
  template = "${length(var.startup_script_template) > 0 ?
    var.startup_script_template :
    file("${path.module}/templates/startup.sh.tpl")
  }"

  vars {
    additional_startup_script = "${var.additional_startup_script}"
  }
}

resource "google_compute_instance_template" "primary" {
  count = "${length(local.availability_zones)}"

  name_prefix = "nat-0-${element(split("-", local.availability_zones[count.index]), 2)}"
  description = "Titan Primary NAT Gateway Instance Template in ${local.availability_zones[count.index]}."

  machine_type = "${var.instance_type}"
  can_ip_forward = true

  disk {
    auto_delete = true
    boot = true
    source_image = "${var.instance_image}"
    type = "PERSISTENT"
    disk_type = "${var.instance_boot_disk_type}"
    disk_size_gb = "${var.instance_boot_disk_size}"
    mode = "READ_WRITE"
  }

  network_interface {
    subnetwork = "${var.dmz_subnet_ids[count.index % length(var.dmz_subnet_ids)]}"
    address = "${element(google_compute_address.primary_internal.*.address, count.index)}"
    access_config {
      nat_ip = "${element(google_compute_address.primary_external.*.address, count.index)}"
    }
  }

  scheduling {
    automatic_restart = true
    on_host_maintenance = "MIGRATE"
    preemptible = false
  }

  service_account = ["${var.instance_service_account}"]

  metadata = "${local.instance_metadata}"
  tags = "${local.instance_tags}"
  labels = "${local.instance_labels}"

  lifecycle {
    create_before_destroy = true
  }
}
