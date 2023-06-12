variable "subnet_details" {
  type = list(map(string))
}
variable "vnet_name" {
  type = string
}
variable "rg_name" {
  type = string
}
variable "location" {
  type = string
}
variable "nic_name" {
  type = string
}
variable "ip_configuration_name" {
  type = string
}
variable "pvt_ip_allocation_type" {
  type = string
}
variable "vm_name" {
  type = string
}
variable "vm_size" {
  type = string
}
variable "vm_image_reference" {
  type = map(string)
}
variable "disk_detail" {
  type = map(string)
}
variable "admin_username" {
  type = string
}
variable "admin_password" {
  type      = string
  sensitive = true
}
variable "public_ip_name" {
  type = string
}
