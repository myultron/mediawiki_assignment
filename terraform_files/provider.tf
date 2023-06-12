terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.50.0"
    }
  }
  backend "azurerm" {
    resource_group_name = "__backend-rg-name__"
    storage_account_name = "__backend-storage-name__"
    container_name = "__backend-container-name__"
    key = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}