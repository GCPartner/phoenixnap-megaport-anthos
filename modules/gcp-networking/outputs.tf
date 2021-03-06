output "interconnect_pairing_key" {
  value       = google_compute_interconnect_attachment.megaport_interconnect.pairing_key
  description = "The Pairing Key for Megaport"
}

output "gcp_network_name" {
  value       = google_compute_network.gpc_network.name
  description = "The name of the GCP Network"
}

output "gcp_subnet_name" {
  value       = google_compute_subnetwork.k8s.self_link
  description = "The name of the GCP Subnet"
}
