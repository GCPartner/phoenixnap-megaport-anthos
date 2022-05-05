resource "google_container_cluster" "primary" {
  name               = var.cluster_name
  project            = var.gcp_project_id
  location           = var.gcp_region
  network            = var.gcp_network_name
  initial_node_count = var.gke_node_count
  release_channel {
    channel = var.gke_release_channel
  }
  node_config {
    machine_type = var.gke_machine_type
  }
}
