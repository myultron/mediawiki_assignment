variable "rg_name" {
  type = string
}
variable "vnet_name" {
  type = string
}
variable "location" {
  type = string
}
variable "nsg_name" {
  type = string
}
variable "vnet_address_space" {
  type = list(string)
}
variable "dns_servers" {
  type = list(string)
}
variable "subnet_details" {
  type = list(map(string))
  default = [
    {
      name           = "subnet1"
      address_prefix = "10.2.0.0/24"
    },
    {
      name           = "subnet2"
      address_prefix = "10.2.1.0/24"
    }
  ]
}
variable "nsg_rule_details" {
  type = list(map(string))
}