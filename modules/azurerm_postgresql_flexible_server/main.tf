resource "azurerm_postgresql_flexible_server" "psql" {

  for_each = var.psql

  name                = each.value.psql_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location

  version = each.value.version

  administrator_login    = each.value.administrator_login
  administrator_password = each.value.administrator_password

  storage_mb   = each.value.storage_mb
  storage_tier = each.value.storage_tier
  sku_name     = each.value.sku_name

  public_network_access_enabled = true
}