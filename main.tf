# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  /*
  cloud {
    organization = "madhugothamllc"
    workspaces {
      name = "learn-terraform-2-azure"
    }

  }
  */
  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = "westus2"
  tags = {
    Environment = "Terraform Getting Started"
    Team        = "DevOps"
  }
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = ["172.16.0.0/16"]
  location            = "westus2"
  resource_group_name = azurerm_resource_group.rg.name
}