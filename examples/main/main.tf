terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.0.0"
    }
    azurecaf = {
      source  = "aztfmod/azurecaf"
      version = "~> 1.1"
    }
    azapi = {
      source  = "azure/azapi"
      version = "~> 0.1"
    }
  }
}

provider "azurerm" {
  features {}
}
