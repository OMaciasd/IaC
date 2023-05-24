#-------------------------------------
# LFA Creation - Default is "true"
#-------------------------------------
resource "azurerm_linux_function_app" "functions" {
  service_plan_id      = local.plan
  resource_group_name  = local.group
  storage_account_name = local.storage
  name                 = local.function
  location             = local.location
# app_settings         = var.app_settings

  /* auth_settings {
    token_refresh_extension_hours =
  } */
  site_config {
    always_on = local.always

    # RULES DE ACCESS AND RESTRICTION ON AZURE FUNCTION APP.
    ip_restriction {
      ip_address = local.ip
      name       = local.rule
      action     = local.action
      priority   = local.priority
    }
  }

  tags = {
    environment = local.environment
  }
}

#-------------------------------------
# PE Creation - Default is "true"
#-------------------------------------
resource "azurerm_private_endpoint" "functions" {
  resource_group_name = local.group
  subnet_id           = local.private
  location            = local.location
  name                = local.endpoint

  private_service_connection {
    is_manual_connection           = local.manual
    name                           = local.pscendpoint
    subresource_names              = [local.subresource]
    private_connection_resource_id = azurerm_linux_function_app.functions.id
  }
}

#----------------------------------------
# ASVNSC Integration - Default is "true"
#----------------------------------------
resource "azurerm_app_service_virtual_network_swift_connection" "functions" {
  subnet_id      = local.public
  app_service_id = azurerm_linux_function_app.functions.id
}
