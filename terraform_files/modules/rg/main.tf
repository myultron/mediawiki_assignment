resource "azurerm_resource_group" "rg_deployment" {
  name     = var.rg_name
  location = var.region
}