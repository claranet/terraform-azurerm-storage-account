terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.9"
    }
    azurecaf = {
      source  = "claranet/azurecaf"
      version = "~> 1.2.28"
    }
    azapi = {
      source  = "Azure/azapi"
      version = "~> 2.3"
    }
  }
}
