# Colossus NAT Module

data "google_compute_zones" "available" {}

locals {
  autohealing_initial_delay = 120
  # get a sorted list of availability zones with an upper limit set by max_availability_zones
  availability_zones = ["${sort(slice(
    data.google_compute_zones.available.names, 0, min(
      length(data.google_compute_zones.available.names),
      var.max_availability_zones
    )
  ))}"]

  healthcheck_healthy_threshold = 3
  healthcheck_interval = 10
  healthcheck_path = "/health-check"
  healthcheck_port = 8080
  healthcheck_timeout = 5
  healthcheck_unhealthy_threshold = 6

  instance_image = "centos-cloud/centos-7"
  instance_labels = {
    "colossus-network" = "${var.network_name}",
    "colossus-layer"   = "dmz"
  }
  instance_metadata = {
    "startup-script" = "${data.template_file.instance_startup_script.rendered}"
  }
  instance_tags = "${concat(list(local.primary_instance_tag), list("colossus-dmz", "public"))}"

  primary_instance_tag = "nat-gateway"
  private_routing_tags = ["nat", "private"]
  private_route_regional_priority = 850
  private_route_zonal_priority = 800
}

variable "dmz_cidr_block" {}
variable "dmz_subnet_id" {}
variable "max_availability_zones" { default = 5 }
variable "network_cidr_block" {}
variable "network_name" {}
variable "vpc_id" {}
variable "zonal_high_availability" { default = false }

output "availability_zones" { value = ["${local.availability_zones}"] }
