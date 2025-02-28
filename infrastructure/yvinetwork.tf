resource "azurerm_resource_group" "yvisocialrg" {
  name     = "socialmedia-rg"
  location = "East US"
}

resource "azurerm_virtual_network" "socialvnet" {
  name                = "socialmedia-vnet"
  location            = azurerm_resource_group.yvisocialrg.location
  resource_group_name = azurerm_resource_group.yvisocialrg.name
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "subnet" {
  name                 = "webapp-subnet"
  resource_group_name  = azurerm_resource_group.yvisocialrg.name
  virtual_network_name = azurerm_virtual_network.socialvnet.name
  address_prefixes     = ["10.0.1.0/24"]
}
