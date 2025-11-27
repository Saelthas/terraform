module "vnet_module_terraform" {
  source       = "./modules/vnet"
  vnetName     = "raruzamenVnetModule"
  location     = var.location
  segmentoVNet = var.segmentoVNet
  rg_name      = "${local.prefix}-rg"
}
# data "azurerm_virtual_network" "vnet_data" {
#   name                = "terraform-vnet-dalvinder"
#   resource_group_name = "terraform-rg-dalvinder"
# }

resource "azurerm_subnet" "subnet1" {
  name                 = "${local.prefix}-subnet1"
  resource_group_name  = module.vnet_module_terraform.resource_group_name
  virtual_network_name = module.vnet_module_terraform.vnet_name
  address_prefixes     = ["10.0.5.0/24"]
}
resource "azurerm_network_security_group" "terraform_nsg" {
  name                = "${local.prefix}-nsg"
  location            = var.location
  resource_group_name = module.vnet_module_terraform.resource_group_name
  tags = {
    environment = var.environment
  }
}
resource "azurerm_network_security_rule" "terraform_nsr" {
  name                        = "allow-ssh-inbound-nsr"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = var.allowedIp
  destination_address_prefix  = "*"
  resource_group_name         = module.vnet_module_terraform.resource_group_name
  network_security_group_name = azurerm_network_security_group.terraform_nsg.name
}
resource "azurerm_network_security_rule" "terraform_nsr_80" {
  name                        = "allow-http-inbound-nsr"
  priority                    = 300
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "80"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = module.vnet_module_terraform.resource_group_name
  network_security_group_name = azurerm_network_security_group.terraform_nsg.name
}
resource "azurerm_network_security_rule" "terraform_nsr_443" {
  name                        = "allow-https-inbound-nsr"
  priority                    = 200
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = module.vnet_module_terraform.resource_group_name
  network_security_group_name = azurerm_network_security_group.terraform_nsg.name
}

resource "azurerm_public_ip" "terraform_public_ip" {
  name                = "${local.prefix}-public-ip"
  resource_group_name = module.vnet_module_terraform.resource_group_name
  location            = var.location
  allocation_method   = var.allocation_method
  sku = var.sku

  tags = {
    environment = var.environment
  }
}
resource "azurerm_network_interface" "terraform_nic" {
  name                = "${local.prefix}-nic"
  location            = var.location
  resource_group_name = module.vnet_module_terraform.resource_group_name

  ip_configuration {
    name                          = "${local.prefix}-nci-ip"
    subnet_id                     = azurerm_subnet.subnet1.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.terraform_public_ip.id
  }
}
# resource "azurerm_subnet_network_security_group_association" "terraform_sga" {
#   subnet_id                 = azurerm_subnet.subnet1.id
#   network_security_group_id = azurerm_network_security_group.terraform_nsg.id
# }
resource "azurerm_network_interface_security_group_association" "terraform_security_group_association" {
  network_interface_id      = azurerm_network_interface.terraform_nic.id
  network_security_group_id = azurerm_network_security_group.terraform_nsg.id
}

resource "azurerm_virtual_machine" "terraform-vm" {
  name                  = "${local.prefix}-vm"
  location              = var.location
  resource_group_name   = module.vnet_module_terraform.resource_group_name
  network_interface_ids = [azurerm_network_interface.terraform_nic.id]
  vm_size               = "Standard_B1s"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  # delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  # delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  storage_os_disk {
    name              = "${local.prefix}-osdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "hostname"
    admin_username = "testadmin"
    admin_password = "TerraformTest!"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    environment = "staging"
  }
}