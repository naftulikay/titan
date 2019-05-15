# Kubernetes Demo Resources

resource "google_container_cluster" "default" {
  name = "example-public"
  description = "Colossus GKE Experiment"
  location = "${module.network.region}"

  initial_node_count = 1
  remove_default_node_pool = true

  network = "${module.network.vpc_id}"
  subnetwork = "${module.network.dmz_subnet_id}"

  ip_allocation_policy {
    cluster_secondary_range_name  = "${module.network.dmz_container_range_name}"
    services_secondary_range_name = "${module.network.dmz_services_range_name}"
  }
}

resource "google_container_node_pool" "default" {
  name = "default"

  location = "${module.network.region}"
  cluster = "${google_container_cluster.default.name}"
  # total nodes = node_count * availability_zones
  node_count = 1

  node_config {
    disk_size_gb = 32
    machine_type = "n1-standard-1"

    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]

    labels {
      "colossus-network" = "${module.network.name}"
      "colossus-layer"   = "${module.network.dmz_name}"
    }

    tags = ["colossus-dmz", "public"]
  }
}
