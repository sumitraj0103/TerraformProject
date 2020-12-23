provider "azurerm" {
features {}
version = "=2.0"
}

resource "azurerm_resource_group" "rg" {
name ="Terraform-test"
location = "West US"
tags = {

environment = "test"
}

}

