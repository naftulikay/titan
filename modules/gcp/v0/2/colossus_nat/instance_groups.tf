# Colossus NAT Module - Instance Group Resources

resource "google_compute_instance_group_manager" "primary" {
  count = "${length(local.availability_zones)}"

  name = "nat-0-${element(split("-", local.availability_zones[count.index]), 2)}"
  base_instance_name = "nat-0-${element(split("-", local.availability_zones[count.index]), 2)}"
  description = "Colossus Primary NAT Gateway Instance Group in ${local.availability_zones[count.index]}."
  zone = "${local.availability_zones[count.index]}"

  target_size = 1

  wait_for_instances = true

  version {
    name = "nat-v0"
    instance_template = "${element(google_compute_instance_template.primary.*.self_link, count.index)}"
  }

  named_port {
    name = "health-check"
    port = "${local.healthcheck_port}"
  }

  auto_healing_policies {
    health_check = "${google_compute_health_check.default.self_link}"
    initial_delay_sec = "${local.autohealing_initial_delay}"
  }
}

resource "google_compute_instance_group_manager" "secondary" {
  count = "${var.zonal_high_availability ? length(local.availability_zones) : 0}"

  name = "nat-1-${element(split("-", local.availability_zones[count.index]), 2)}"
  base_instance_name = "nat-1-${element(split("-", local.availability_zones[count.index]), 2)}"
  description = "Colossus Secondary NAT Gateway Instance Group in ${local.availability_zones[count.index]}."
  zone = "${local.availability_zones[count.index]}"

  target_size = 1

  wait_for_instances = true

  version {
    name = "nat-v0"
    instance_template = "${element(google_compute_instance_template.secondary.*.self_link, count.index)}"
  }

  named_port {
    name = "health-check"
    port = "${local.healthcheck_port}"
  }

  auto_healing_policies {
    health_check = "${google_compute_health_check.default.self_link}"
    initial_delay_sec = "${local.autohealing_initial_delay}"
  }

  depends_on = ["google_compute_instance_group_manager.primary"]
}
