# Titan Layer Module - Subnet Resources

locals {
  primary_cidr_blocks = [
    "10.${var.network_id}.${(var.layer_index * 10) + 0}.0/23",
    "10.${var.network_id}.${(var.layer_index * 10) + 2}.0/23",
    "10.${var.network_id}.${(var.layer_index * 10) + 4}.0/23",
    "10.${var.network_id}.${(var.layer_index * 10) + 6}.0/23",
    "10.${var.network_id}.${(var.layer_index * 10) + 8}.0/23",
  ]

  secondary_cidr_blocks = [
    "10.${var.network_id}.${(var.layer_index < 5 ? 200 : 100) + (var.layer_index * 10) + 0}.0/23",
    "10.${var.network_id}.${(var.layer_index < 5 ? 200 : 100) + (var.layer_index * 10) + 2}.0/23",
    "10.${var.network_id}.${(var.layer_index < 5 ? 200 : 100) + (var.layer_index * 10) + 4}.0/23",
    "10.${var.network_id}.${(var.layer_index < 5 ? 200 : 100) + (var.layer_index * 10) + 6}.0/23",
    "10.${var.network_id}.${(var.layer_index < 5 ? 200 : 100) + (var.layer_index * 10) + 8}.0/23",
  ]

  secondary_names = [
    "${var.name}-container-0",
    "${var.name}-container-1",
    "${var.name}-container-2",
    "${var.name}-container-3",
    "${var.name}-container-4",
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
 * Secondary, container ranges for each subnet are created at the upper end of the /16:
 *
 *   - 10.0.200.0/23
 *   - 10.0.202.0/23
 *   - 10.0.204.0/23
 *   - 10.0.206.0/23
 *   - 10.0.208.0/23
 *
 * For layer indices of five or greater, the subnets will wrap to the upper 100 range in the third octet. For a layer
 * index of 5, the following container ranges will be created for that layer:
 *
 *   - 10.0.150.0/23
 *   - 10.0.152.0/23
 *   - 10.0.154.0/23
 *   - 10.0.156.0/23
 *   - 10.0.158.0/23
 *
 * Custom layers are usually the exception and not the rule, so only add layers if you are sure that you absolutely need
 * them and only after studying the source code here until all logic is clear.
 */
resource "google_compute_subnetwork" "default" {
  count = "5"

  region = "${var.region}"

  name = "${var.name}-${count.index}"
  description = "Titan ${title(var.name)} Layer, Subnet ${count.index + 1}/5 in the Titan ${var.network_name_fancy} Network."
  network = "${var.vpc_id}"
  private_ip_google_access = true

  ip_cidr_range = "${local.primary_cidr_blocks[count.index]}"

  secondary_ip_range {
    range_name = "${local.secondary_names[count.index]}"
    ip_cidr_range = "${local.secondary_cidr_blocks[count.index]}"
  }
}
