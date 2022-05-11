<!-- BEGIN_TF_DOCS -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_prefix"></a> [prefix](#input\_prefix) | The requested asn for Megaport | `string` | n/a | yes |
| <a name="input_megaport_requested_asn"></a> [megaport\_requested\_asn](#input\_megaport\_requested\_asn) | The requested asn for Megaport | `number` | n/a | yes |
| <a name="input_interconnect_pairing_key"></a> [interconnect\_pairing\_key](#input\_interconnect\_pairing\_key) | The requested asn for Megaport | `string` | n/a | yes |
| <a name="input_pnap_vlan_id"></a> [pnap\_vlan\_id](#input\_pnap\_vlan\_id) | The requested asn for Megaport | `number` | n/a | yes |
| <a name="input_private_subnet"></a> [private\_subnet](#input\_private\_subnet) | The requested asn for Megaport | `string` | n/a | yes |
| <a name="input_megaport_username"></a> [megaport\_username](#input\_megaport\_username) | The username for Megaport | `string` | n/a | yes |
| <a name="input_megaport_password"></a> [megaport\_password](#input\_megaport\_password) | The password for Megaport | `string` | n/a | yes |
| <a name="input_pnap_backend_megaport_vlan_id"></a> [pnap\_backend\_megaport\_vlan\_id](#input\_pnap\_backend\_megaport\_vlan\_id) | The vLan ID mapped on the MegaPort side by PNAP (Provided by PNAP) | `number` | n/a | yes |
| <a name="input_megaport_physical_port_id"></a> [megaport\_physical\_port\_id](#input\_megaport\_physical\_port\_id) | The Physical Port ID you'll use on within the PhoenixNAP DC to connect to MegaPort | `string` | n/a | yes |
<!-- END_TF_DOCS -->