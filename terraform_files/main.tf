module "rg_deployment" {
  source  = "./modules/rg/"
  rg_name = var.rg_name
  region  = var.location
}

module "vnet_deployment" {
  source             = "./modules/vnet/"
  rg_name            = var.rg_name
  location           = var.location
  vnet_name          = var.vnet_name
  nsg_name           = var.nsg_name
  vnet_address_space = var.vnet_address_space
  dns_servers        = var.dns_servers
  subnet_details     = var.subnet_details
  nsg_rule_details   = var.nsg_rule_details
  depends_on         = [module.rg_deployment]
}
module "vm_deployment" {
  source                 = "./modules/vm/"
  vm_name                = var.vm_name
  vnet_name              = var.vnet_name
  rg_name                = var.rg_name
  location               = var.location
  subnet_details         = var.subnet_details
  nic_name               = var.nic_name
  ip_configuration_name  = var.ip_configuration_name
  pvt_ip_allocation_type = var.pvt_ip_allocation_type
  vm_size                = var.vm_size
  vm_image_reference     = var.vm_image_reference
  disk_detail            = var.disk_detail
  admin_username         = var.admin_username
  admin_password         = var.admin_password
  public_ip_name         = var.public_ip_name
  depends_on             = [module.vnet_deployment]
}