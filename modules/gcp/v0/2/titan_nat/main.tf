# Titan NAT Module

data "google_compute_zones" "available" {}

locals {
  allowed_ssh_network_block = "${
    var.allow_local_ssh_access ? var.network_cidr_block : "127.0.0.0/32"
  }"

  availability_zones = ["${sort(slice(
    data.google_compute_zones.available.names, 0, min(
      length(data.google_compute_zones.available.names),
      var.max_availability_zones
    )
  ))}"]

  instance_labels = "${
    merge(
      var.instance_labels,
      var.additional_instance_labels,
    )
  }"

  instance_metadata = "${
    merge(
      map("startup-script", "${data.template_file.instance_startup_script.rendered}"),
      var.instance_metadata
    )
  }"

  instance_tags = "${
    concat(
      var.instance_tags,
      var.additional_instance_tags
    )
  }"

  startup_script = "${data.template_file.instance_startup_script.rendered}"
  startup_script_template = "${data.template_file.instance_startup_script.template}"
}
