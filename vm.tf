resource "azurerm_resource_group" "tf-vmrg01" {
    
    name        = "vmrg01"
    location    = "centralindia"
}

resource "azurerm_public_ip" "tf-vm01_pip" {
    name                = "vm01_pip"
    resource_group_name = azurerm_resource_group.tf-vmrg01.name
    location            = azurerm_resource_group.tf-vmrg01.location
    allocation_method   = "Static"
}

resource "azurerm_network_interface" "tf-vm01_nic" {
    name                = "vm01_nic"
    resource_group_name = azurerm_resource_group.tf-vmrg01.name
    location            = azurerm_resource_group.tf-vmrg01.location

    ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.tf-vn01_snet01.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.tf-vm01_pip.id
  }
}

resource "azurerm_windows_virtual_machine" "tf-vm01" {
    name                  = "vm01"
    location              = azurerm_resource_group.tf-vmrg01.location
    resource_group_name   = azurerm_resource_group.tf-vmrg01.name
    size                  = "Standard_B1s"
    admin_username        = "mani"
    admin_password        = "Mg@1234567890"
    network_interface_ids = [ 
    "azurerm_network_interface.tf-vm01_nic.id"
     ]
}

os_disk {
    name                 = "vm01_osd01"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }


