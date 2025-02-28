resource "azurerm_service_plan" "appserviceplan" {
  name                = "socialmedia-plan"
  resource_group_name = azurerm_resource_group.yvisocialrg.name
  location            = azurerm_resource_group.yvisocialrg.location
  os_type             = "Linux"
  sku_name            = "B1"
}

resource "azurerm_linux_web_app" "backend" {
  name                = "socialmedia-backend"
  resource_group_name = azurerm_resource_group.yvisocialrg.name
  location            = azurerm_resource_group.yvisocialrg.location
  service_plan_id     = azurerm_service_plan.appserviceplan.id

  site_config {
    application_stack {
      node_version = "18-lts"
    }
  }
}
