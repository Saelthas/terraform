resource "azurerm_resource_group" "terraform_rg" {
  name     = "${var.rg_name}-${terraform.workspace}"
  location = var.location
}