variable "cluster_name" {
  description = "The name(s) of the clusters to be deployed"
  type        = string
  default     = "my-cluster"
}

variable "cloud" {
  description = "The Cloud to deploy the Baremetal cluster on"
  type        = string
  default     = "PNAP"
}

variable "pnap_client_id" {
  description = "The client id for authentication to pnap"
  type        = string
}

variable "pnap_client_secret" {
  description = "The client secret for authentication to pnap"
  type        = string
}

variable "pnap_location" {
  description = "The pnap region to deploy nodes to"
  type        = string
  default     = "PHX"
}

variable "pnap_worker_type" {
  description = "The type of PNAP server to deploy for worker nodes"
  type        = string
  default     = "s2.c1.medium"
}

variable "pnap_cp_type" {
  description = "The type of PNAP server to deploy for control plane nodes"
  type        = string
  default     = "s2.c1.medium"
}

variable "gcp_project_id" {
  description = "The GCP Project ID"
  type        = string
}

variable "ansible_url" {
  description = "The Ansible URL for the Anthos Automation"
  type        = string
  default     = "https://github.com/GCPartner/ansible-gcpartner-anthos-baremetal/archive/refs/heads/v0.0.1.tar.gz"
}

variable "ansible_tar_ball" {
  description = "The name of the ansible tarball"
  type        = string
  default     = "v0.0.1.tar.gz"
}

variable "gcp_region" {
  description = "The GCP Region"
  type        = string
  default     = "us-west4"
}

variable "gke_node_count" {
  description = "The number of worker nodes for the GKE cluster"
  type        = number
  default     = 1
}

variable "gke_release_channel" {
  description = "The requested asn for Megaport"
  type        = string
  default     = "RAPID"
}

variable "gke_machine_type" {
  description = "The requested asn for Megaport"
  type        = string
  default     = "c2-standard-4"
}

variable "gcp_router_asn" {
  description = "The requested asn for Megaport"
  type        = number
  default     = 16550
}

variable "megaport_requested_asn" {
  description = "The requested asn for Megaport"
  type        = number
  default     = 64555
}

variable "megaport_username" {
  description = "The username for Megaport"
  type        = string
}

variable "megaport_password" {
  description = "The password for Megaport"
  type        = string
}

variable "domain_name" {
  description = "The domain name to use for DNS records"
  type        = string
}

variable "cert_manager_version" {
  description = "The version of cert manager to install"
  type        = string
  default     = "v1.8.0"
}

variable "email_address" {
  description = "The email address to use with Cert Manager"
  type        = string
}

variable "pnap_network_name" {
  type        = string
  default     = ""
  description = "The network_id to use when creating server in PNAP"
}

variable "pnap_backend_megaport_vlan_id" {
  type        = number
  description = "The vLan ID mapped on the MegaPort side by PNAP (Provided by PNAP)"
}
