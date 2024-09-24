# GKE cluster
resource "google_container_cluster" "primary" {
  name     = "demo-cluster"
  location = var.region

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1

  network             = google_compute_network.vpc.name
  subnetwork          = google_compute_subnetwork.subnet.name
  deletion_protection = false
}

# Separately Managed Node Pool
resource "google_container_node_pool" "primary_nodes" {
  name     = "${google_container_cluster.primary.name}-node-pool"
  location = var.region
  cluster  = google_container_cluster.primary.name

  # arbritrary choosen
  autoscaling {
    min_node_count = 3
    max_node_count = 6
  }

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/devstorage.read_only"
    ]

    labels = {
      env = var.project
    }
    tags = ["gke-node", "demo-cluster"]
    metadata = {
      disable-legacy-endpoints = "true"
    }
  }
}