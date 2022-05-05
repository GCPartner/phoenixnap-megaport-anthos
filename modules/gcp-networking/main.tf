resource "google_compute_network" "gpc_network" {
  name                    = format("%s-network", var.cluster_name)
  project                 = var.gcp_project_id
  auto_create_subnetworks = true
  mtu                     = 1500
}

resource "google_compute_router" "cloud_router" {
  bgp {
    advertise_mode = "DEFAULT"
    asn            = var.gcp_router_asn
  }
  name    = format("%s-router", var.cluster_name)
  project = var.gcp_project_id
  region = var.gcp_region
  network = google_compute_network.gpc_network.name
}

resource "google_compute_interconnect_attachment" "megaport_interconnect" {
  name   = format("%s-interconnect", var.cluster_name)
  project = var.gcp_project_id
  region = var.gcp_region
  type   = "PARTNER"
  router = google_compute_router.cloud_router.id
  mtu    = 1500
}
