
# Workflow
# Write => Init => Plan => Apply => Destroy
# terraform apply --auto-approve # Se utiliza para una confirmación automática de apply o destroy
# terraform refresh # refrescar los cambios que se pudieron haber hecho directamente desde el portal
# terraform plan -refresh-only # me muestra cambios manuales sin integrarlos al estado


resource "azurerm_resource_group" "rg" {
  name     = "rAruzamen-rg-${terraform.workspace}"
  location = "eastus"
  tags = {
    Project     = "Terraform"
    Owner       = "rAruzamen"
    Environment = "Dev"
  }
}
