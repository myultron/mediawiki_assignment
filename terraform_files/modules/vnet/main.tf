resource "azurerm_network_security_group" "nsg" {
  name                = var.nsg_name
  location            = var.location
  resource_group_name = var.rg_name
  dynamic "security_rule" {
    for_each = var.nsg_rule_details
    content {
      name                       = "test123"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  }
}
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.rg_name
  address_space       = var.vnet_address_space                          #["10.0.0.0/16"]
  dns_servers         = concat(var.dns_servers, ["8.8.8.8", "8.8.4.4"]) #["10.0.0.4", "10.0.0.5"]

  dynamic "subnet" {
    for_each = var.subnet_details
    content {
      name           = subnet.value.name
      address_prefix = subnet.value.address_prefix
      security_group = azurerm_network_security_group.nsg.id
    }
  }
  tags = {
    business_owner = "Thoughtworks"
  }

  lifecycle {
    ignore_changes = [tags]
  }
}