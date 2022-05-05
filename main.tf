module "baremetal-anthos-cluster" {
  source             = "github.com/GCPartner/terraform-gcpartner-anthos-baremetal?ref=v0.0.1"
  cluster_name       = format("pnap-%s", var.cluster_name)
  cloud              = var.cloud
  pnap_client_id     = var.pnap_client_id
  pnap_client_secret = var.pnap_client_secret
  pnap_location      = var.pnap_location
  pnap_worker_type   = var.pnap_worker_type
  pnap_cp_type       = var.pnap_cp_type
  gcp_project_id     = var.gcp_project_id
  ansible_url        = var.ansible_url
  ansible_tar_ball   = var.ansible_tar_ball
}

module "gcp-networking" {
  source         = "./modules/gcp-networking"
  cluster_name   = var.cluster_name
  gcp_router_asn = var.gcp_router_asn
  gcp_project_id = var.gcp_project_id
  gcp_region     = var.gcp_region
}

module "gke-cluster" {
  source              = "./modules/gke-cluster"
  cluster_name        = format("gke-%s", var.cluster_name)
  gcp_project_id      = var.gcp_project_id
  gcp_region          = var.gcp_region
  gke_node_count      = var.gke_node_count
  gke_release_channel = var.gke_release_channel
  gke_machine_type    = var.gke_machine_type
  gcp_network_name    = module.gcp-networking.gcp_network_name
  gcp_subnet_name     = module.gcp-networking.gcp_subnet_name
}

module "megaport" {
  source                   = "./modules/megaport"
  prefix                   = var.cluster_name
  megaport_requested_asn   = var.megaport_requested_asn
  interconnect_pairing_key = module.gcp-networking.interconnect_pairing_key
  pnap_vlan_id             = module.baremetal-anthos-cluster.vlan_id
  private_subnet           = module.baremetal-anthos-cluster.private_subnet
  megaport_username        = var.megaport_username
  megaport_password        = var.megaport_password
}
