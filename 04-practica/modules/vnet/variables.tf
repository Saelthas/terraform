variable "rg_name"{
  description = "Nombre del grupo de recursos"
  type = string
  #default = "rAruzamen-qa-rg"
}
variable "vnetName"{
  description = "Nombre del grupo de recursos de la vNet"
  type = string
  #default = "vNet_rAruzamen"
}

variable "location" {
  description = "Ubicacion de los recursos"
  type = string
  #default = "East US"
}
variable "segmentoVNet" {
  description = "Segmento principal de la vnet"
  type = list(string)
  #default = ["10.0.0.0/16"]
}
variable "subNet_names" {
  description = "nombres de las subnets"
  type = list(string)
  default = ["subnet_one","subnet_two","subnet_three"]
}
variable "subnetNameTwo"{
  description = "Nombre del grupo de recursos de la subNet"
  type = string
  default = "subnet_Aruzamen_Two"
}
variable "segmentoSubNets" {
  description = "Segmento principal de las subnets"
  type = list(string)
  default = ["10.0.1.0/24","10.0.2.0/24","10.0.3.0/24"]
}
