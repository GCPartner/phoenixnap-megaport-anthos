variable "prefix" {
  description = "The requested asn for Megaport"
  type        = string
}

variable "megaport_requested_asn" {
  description = "The requested asn for Megaport"
  type        = number
}

variable "interconnect_pairing_key" {
  description = "The requested asn for Megaport"
  type        = string
}

variable "pnap_vlan_id" {
  description = "The requested asn for Megaport"
  type        = number
}

variable "private_subnet" {
  description = "The requested asn for Megaport"
  type        = string
}

variable "megaport_username" {
  description = "The username for Megaport"
  type        = string
}

variable "megaport_password" {
  description = "The password for Megaport"
  type        = string
}

variable "pnap_backend_megaport_vlan_id" {
  type        = number
  description = "The vLan ID mapped on the MegaPort side by PNAP (Provided by PNAP)"
}
