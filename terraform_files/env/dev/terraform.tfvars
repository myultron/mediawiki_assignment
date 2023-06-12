rg_name            = "__rg_name__"
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

nic_name               = "assignment_nic"
ip_configuration_name  = "ipconfig1"
pvt_ip_allocation_type = "Dynamic"
vm_name                = "assignment_vm"
vm_size                = "Standard_B2s"
vm_image_reference = {
  publisher = "RedHat"
  offer     = "RHEL"
  sku       = "8-lvm-gen2"
  version   = "latest"
}
disk_detail = {
  name         = "osdisk1"
  caching_type = "ReadWrite"
  disk_type    = "Standard_LRS"
}
admin_username = "__adminusername__"
admin_password = "__adminpassword__"
public_ip_name = "__public_ip_name__"
nsg_rule_details = [
  {
    name                       = "Allowsshport"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "22"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  },
  {
    name                       = "Allowhttpport"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "80"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
]