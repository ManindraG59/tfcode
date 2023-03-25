terraform {
  backend "azurerm" {
    storage_account_name = ""
    container_name = ""
    key = "mani.tfstate"
    access_key = ""
    features{

    }
  }
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}
