provider "azurerm" {
# Whilst version is optional, we /strongly recommend/ using it to pin the version of the Provider being used
  version = "=2.4.0"

  subscription_id = "27426494-41b4-4991-8c4b-c722fee829ac"
  client_id       = "1f1b045e-08d8-4f50-9448-1d3b183fe989"
  client_secret   = "Pumzy8SCVF399~~.._mik2hcoGhjjWs8U7"
  tenant_id       = "91700184-c314-4dc9-bb7e-a411df456a1e"

  features {}
}

resource "azurerm_resource_group" "rg" {
name ="Terraform-test1"
location = "West US"
tags = {

environment = "test"
}

}

