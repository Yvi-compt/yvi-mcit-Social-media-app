resource "azurerm_cosmosdb_account" "mongodb" {
  name                = "socialmedia-mongodb"
  location            = azurerm_resource_group.yvisocialrg.location
  resource_group_name = azurerm_resource_group.yvisocialrg.name
  offer_type          = "Standard"
  kind                = "MongoDB"
}

resource "azurerm_redis_cache" "redis" {
  name                = "socialmedia-redis"
  location            = azurerm_resource_group.yvisocialrg.location
  resource_group_name = azurerm_resource_group.yvisocialrg.name
  capacity            = 1
  family              = "C"
  sku_name            = "Basic"
}
