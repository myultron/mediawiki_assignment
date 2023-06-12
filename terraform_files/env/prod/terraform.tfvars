rg_name            = "assessme_rg"
vnet_name          = "assessment_vnet"
location           = "eastus"
nsg_name           = "assesment_nsg"
vnet_address_space = ["10.2.0.0/16"]
dns_servers        = ["10.2.0.4", "10.2.0.5"]
subnet_details = [
  {
    name           = "subnet0"
    address_prefix = "10.2.0.0/24"
  },
  {
    name           = "subnet1"
    address_prefix = "10.2.1.0/24"
  }
]
