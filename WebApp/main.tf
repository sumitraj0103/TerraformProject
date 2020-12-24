provider "azurerm" {
  features {}
  version = "=2.4.0"

  subscription_id = "27426494-41b4-4991-8c4b-c722fee829ac"
  client_id       = "1f1b045e-08d8-4f50-9448-1d3b183fe989"
  client_secret   = "Pumzy8SCVF399~~.._mik2hcoGhjjWs8U7"
  tenant_id       = "91700184-c314-4dc9-bb7e-a411df456a1e"
}

resource "azurerm_resource_group" "main" {
  name     = "${var.prefix}-resources"
  location = "${var.location}"
}

resource "azurerm_app_service_plan" "main" {
  name                = "${var.prefix}-asp"
  location            = "${azurerm_resource_group.main.location}"
  resource_group_name = "${azurerm_resource_group.main.name}"

  sku {
    tier = "Basic"
    size = "B1"
  }
}

resource "azurerm_app_service" "main" {
  name                = "${var.prefix}-appservice"
  location            = "${azurerm_resource_group.main.location}"
  resource_group_name = "${azurerm_resource_group.main.name}"
  app_service_plan_id = "${azurerm_app_service_plan.main.id}"

  site_config {
    dotnet_framework_version = "v4.0"
    remote_debugging_enabled = true
    remote_debugging_version = "VS2017"
  }
}
