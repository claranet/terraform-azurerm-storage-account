data "http" "my_ip" {
  url = "http://ip4.clara.net/?raw"
}

module "azure_region" {
  source  = "claranet/regions/azurerm"
  version = "x.x.x"

  azure_region = var.azure_region
}

module "rg" {
  source  = "claranet/rg/azurerm"
  version = "x.x.x"

  client_name    = var.client_name
  environment    = var.environment
  location       = module.azure_region.location
  location_short = module.azure_region.location_short
  stack          = var.stack
}

# module "run" {
#   source  = "claranet/run/azurerm"
#   version = "x.x.x"

#   client_name    = var.client_name
#   environment    = var.environment
#   location       = module.azure_region.location
#   location_short = module.azure_region.location_short
#   stack          = var.stack

#   monitoring_function_enabled = false

#   resource_group_name = module.rg.name
# }
