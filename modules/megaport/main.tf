terraform {
  required_providers {
    megaport = {
      source = "megaport/megaport"
    }
  }
}

provider "megaport" {
  username              = var.megaport_username
  password              = var.megaport_password
  accept_purchase_terms = true
  delete_ports          = false
  environment           = "production"
}

locals {
  megaport_vxc_vlan       = var.pnap_backend_megaport_vlan_id + 1 # Arbitrary, Unique vLan for my MCR to represent the Google Virtual Wire
  megaport_port_id        = var.megaport_physical_port_id         # Provided by PhoenixNAP if usingt their shared port in Phoenix, MegaPorts ID for your Physical CrossConnect in PhoenixNAP DataCenter
  megaport_mcr_port_speed = 1000
}

// megaport locations used for ports and mcr
data "megaport_location" "phx_pnp" {
  name    = "PhoenixNAP"
  has_mcr = true
}

// Create the Megaport MCR used for Routing to GCP
resource "megaport_mcr" "mp_mcr" {
  mcr_name    = "${var.prefix} MCR"
  location_id = data.megaport_location.phx_pnp.id

  router {
    port_speed    = local.megaport_mcr_port_speed
    requested_asn = var.megaport_requested_asn
  }
}

data "megaport_partner_port" "gcp_port" {
  connect_type = "GOOGLE"
  company_name = "Google Inc"
  product_name = "Phoenix (phx-zone1-917)" # This is the Google "OnRamp" physically in, should be in the Marketplace potentially
  location_id  = data.megaport_location.phx_pnp.id
}

// Create the VXC between Megaport MCR and GCP
resource "megaport_gcp_connection" "gcp_interconnect" {
  vxc_name   = format("%s-GCP", var.prefix)
  rate_limit = 50

  a_end {
    port_id        = megaport_mcr.mp_mcr.id
    requested_vlan = local.megaport_vxc_vlan
  }

  csp_settings {
    pairing_key          = var.interconnect_pairing_key
    requested_product_id = data.megaport_partner_port.gcp_port.id
  }

  lifecycle {
    ignore_changes = all
  }
}

// Create VXC between Megaport MCR and BMC
resource "megaport_vxc" "bmc_vxc" {
  vxc_name   = format("%s-BMC", var.prefix)
  rate_limit = 50

  a_end {
    port_id        = megaport_mcr.mp_mcr.id
    requested_vlan = var.pnap_vlan_id # My Private Network vLan
  }

  a_end_mcr_configuration {
    ip_addresses     = [format("%s/%s", cidrhost(var.private_subnet, 1), split("/", var.private_subnet).1)]
    nat_ip_addresses = [cidrhost(var.private_subnet, 1)]
  }

  b_end {
    port_id        = local.megaport_port_id
    requested_vlan = var.pnap_backend_megaport_vlan_id # PhoenixNAP Mapping for MegaPort
  }
}
