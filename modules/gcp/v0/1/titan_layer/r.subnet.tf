# Titan Layer Module - Subnet Resources

locals {
  primary_cidr_blocks = [
    "10.${var.network_id}.${(var.layer_index * 10) + 0}.0/23",
    "10.${var.network_id}.${(var.layer_index * 10) + 2}.0/23",
    "10.${var.network_id}.${(var.layer_index * 10) + 4}.0/23",
    "10.${var.network_id}.${(var.layer_index * 10) + 6}.0/23",
    "10.${var.network_id}.${(var.layer_index * 10) + 8}.0/23",
  ]

  container_range_cidr_blocks = [
    "10.${var.network_id}.${50 + (var.layer_index * 10) + 0}.0/23",
    "10.${var.network_id}.${50 + (var.layer_index * 10) + 2}.0/23",
    "10.${var.network_id}.${50 + (var.layer_index * 10) + 4}.0/23",
    "10.${var.network_id}.${50 + (var.layer_index * 10) + 6}.0/23",
    "10.${var.network_id}.${50 + (var.layer_index * 10) + 8}.0/23",
  ]

  container_range_names = [
    "${var.name}-container-0",
    "${var.name}-container-1",
    "${var.name}-container-2",
    "${var.name}-container-3",
    "${var.name}-container-4",
  ]

  management_range_cidr_blocks = [
    "10.${var.network_id}.${100 + (var.layer_index * 10) + 0}.0/23",
    "10.${var.network_id}.${100 + (var.layer_index * 10) + 2}.0/23",
    "10.${var.network_id}.${100 + (var.layer_index * 10) + 4}.0/23",
    "10.${var.network_id}.${100 + (var.layer_index * 10) + 6}.0/23",
    "10.${var.network_id}.${100 + (var.layer_index * 10) + 8}.0/23",
  ]

  management_range_names = [
    "${var.name}-management-0",
    "${var.name}-management-1",
    "${var.name}-management-2",
    "${var.name}-management-3",
    "${var.name}-management-4",
  ]
}

/**
 * The Titan Layer subnets.
 *
 * Five subnets are created for each layer not for high availability (as Google subnets span all AZs in a region) but
 * for high capacity. As a user, your strategy should be to either divide your managed instance groups and instances
 * across these subnets or to simply start using the next subnet after the current one nears capacity.
 *
 * Primary CIDR ranges for a network id of 0 and a layer id of 0 look like this:
 *
 *   - 10.0.0.0/23
 *   - 10.0.2.0/23
 *   - 10.0.4.0/23
 *   - 10.0.6.0/23
 *   - 10.0.8.0/23
 *
 * Secondary container ranges for each subnet are created with a third octet of 100 as a base:
 *
 *   - 10.0.100.0/23
 *   - 10.0.102.0/23
 *   - 10.0.104.0/23
 *   - 10.0.106.0/23
 *   - 10.0.108.0/23
 *
 * Ternary management (Kubernetes) ranges for each subnet are created with a third octet of 200 as a base:
 *
 *   - 10.0.200.0/23
 *   - 10.0.202.0/23
 *   - 10.0.204.0/23
 *   - 10.0.206.0/23
 *   - 10.0.208.0/23
 */
resource "google_compute_subnetwork" "default" {
  count = "5"

  region = "${var.region}"

  name = "${var.name}-${count.index}"
  description = "Titan ${title(var.name)} Layer, Subnet ${count.index + 1}/5 in the Titan ${var.network_name_fancy} Network."
  network = "${var.vpc_id}"
  private_ip_google_access = true

  ip_cidr_range = "${local.primary_cidr_blocks[count.index]}"

  # container range
  secondary_ip_range {
    range_name = "${local.container_range_names[count.index]}"
    ip_cidr_range = "${local.container_range_cidr_blocks[count.index]}"
  }

  # container management range (for kubernetes)
  secondary_ip_range {
    range_name = "${local.management_range_names[count.index]}"
    ip_cidr_range = "${local.management_range_cidr_blocks[count.index]}"
  }
}
