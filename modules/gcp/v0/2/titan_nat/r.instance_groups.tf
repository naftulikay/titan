# Titan NAT Module - Instance Group Resources

/**
 * Instance group manager for primary NAT instances in each zone, as opposed to secondary, redundant NAT instances.
 *
 * Target size is always one due to the nature of a 1:1 mapping between an internal and external IP and a single host
 * behind it.
 */
resource "google_compute_instance_group_manager" "primary" {
  count = "${length(local.availability_zones)}"

  name = "nat-0-${element(split("-", local.availability_zones[count.index]), 2)}"
  base_instance_name = "nat-0-${element(split("-", local.availability_zones[count.index]), 2)}"
  description = "Titan Primary NAT Gateway Instance Group in ${local.availability_zones[count.index]}."
  zone = "${local.availability_zones[count.index]}"

  update_strategy = "RESTART"
  target_size = 1

  wait_for_instances = true

  instance_template = "${element(google_compute_instance_template.primary.*.self_link, count.index)}"

  named_port {
    name = "health-check"
    port = "${var.healthcheck_port}"
  }

  auto_healing_policies {
    health_check = "${google_compute_health_check.default.self_link}"
    initial_delay_sec = "${var.autohealing_initial_delay}"
  }
}

resource "google_compute_health_check" "default" {
  name = "nat-gateway"

  check_interval_sec = "${var.healthcheck_interval}"
  timeout_sec = "${var.healthcheck_timeout}"
  healthy_threshold = "${var.healthcheck_healthy_threshold}"
  unhealthy_threshold = "${var.healthcheck_unhealthy_threshold}"

  http_health_check {
    port = "${var.healthcheck_port}"
    request_path = "${var.healthcheck_path}"
  }

  lifecycle {
    create_before_destroy = true
  }
}
