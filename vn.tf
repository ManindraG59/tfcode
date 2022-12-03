resource "azurerm_resource_group" "tf-vnrg01" {
    name        = "vnrg01"
    location    = "centralindia"
    
}

resource "azurerm_network_security_group" "tf-vn01_nsg" {
    name                = "vn01_nsg"
    resource_group_name = azurerm_resource_group.tf-vnrg01.name
    location            = azurerm_resource_group.tf-vnrg01.location
}

resource "azurerm_virtual_network" "tf-vn01" {
    name                = "vn01"
    resource_group_name = azurerm_resource_group.tf-vnrg01.name
    location            = azurerm_resource_group.tf-vnrg01.location
    address_space       = ["10.1.0.0/16"]
}

resource "azurerm_subnet" "tf-vn01_snet01" {
    name                    = "vn01_snet01"
    resource_group_name     = azurerm_resource_group.tf-vnrg01.name
    virtual_network_name    = azurerm_virtual_network.tf-vn01.name
    address_prefixes        = ["10.1.0.0/28"] 
}
  
