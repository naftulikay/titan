# Colossus NAT Module - Health CHeck Resources

resource "google_compute_health_check" "default" {
  name = "nat-gateway"

  check_interval_sec = "${local.healthcheck_interval}"
  timeout_sec = "${local.healthcheck_timeout}"
  healthy_threshold = "${local.healthcheck_healthy_threshold}"
  unhealthy_threshold = "${local.healthcheck_unhealthy_threshold}"

  http_health_check {
    port = "${local.healthcheck_port}"
    request_path = "${local.healthcheck_path}"
  }

  lifecycle {
    create_before_destroy = true
  }
}
