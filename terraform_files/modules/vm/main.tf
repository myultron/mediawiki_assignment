data "azurerm_subnet" "vmsubnet" {
  name                 = var.subnet_details[0].name
  virtual_network_name = var.vnet_name
  resource_group_name  = var.rg_name
}
resource "azurerm_public_ip" "publicip" {
  name                = var.public_ip_name
  resource_group_name = var.rg_name
  location            = var.location
  allocation_method   = "Static"
}
resource "azurerm_network_interface" "vm-nic" {
  name                = var.nic_name
  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = var.ip_configuration_name
    subnet_id                     = data.azurerm_subnet.vmsubnet.id
    private_ip_address_allocation = var.pvt_ip_allocation_type #"Dynamic"
    public_ip_address_id          = azurerm_public_ip.publicip.id
  }
}

resource "azurerm_linux_virtual_machine" "main" {
  name                  = var.vm_name
  location              = var.location
  resource_group_name   = var.rg_name
  network_interface_ids = [azurerm_network_interface.vm-nic.id]
  size                  = var.vm_size #"Standard_DS1_v2"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  # delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  # delete_data_disks_on_termination = true

  source_image_reference {
    publisher = var.vm_image_reference.publisher #"Canonical"
    offer     = var.vm_image_reference.offer     #"UbuntuServer"
    sku       = var.vm_image_reference.sku       #"16.04-LTS"
    version   = var.vm_image_reference.version   #"latest"
  }
  os_disk {
    name                 = var.disk_detail.name         #"myosdisk1"
    caching              = var.disk_detail.caching_type #"ReadWrite"
    storage_account_type = var.disk_detail.disk_type    #"Standard_LRS"
  }
  computer_name                   = "assignmentvm"
  admin_username                  = var.admin_username #"testadmin"
  admin_password                  = var.admin_password #"Password1234!"
  disable_password_authentication = false
  tags = {
    CostOwner = "Thoughtworks"
  }

  provisioner "remote-exec" {
    inline = ["sudo yum -y update", "sudo yum install python3 -y", "echo Done!"]
    connection {
      host     = azurerm_public_ip.publicip.ip_address
      type     = "ssh"
      user     = var.admin_username
      password = var.admin_password
    }
  }

  lifecycle {
    ignore_changes = [tags]
  }
}