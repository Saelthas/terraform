variable "rg_name" {
  description = "Nombre del grupo de recursos"
  type        = string
  default     = "Recursos_RubenAruzamen"
}
variable "location" {
  description = "Ubicacion de los recursos"
  type        = string
  default     = "East US"
}
variable "environment" {
  description = "entorno de ejecucion"
  type        = string
  default     = "dev"
}
variable "project_name" {
  description = "nombre del proyecto"
  type        = string
  default     = "TFCourse"
}
variable "vnetName"{
  description = "Nombre del grupo de recursos de la vNet"
  type = string
  default = "vNet_rAruzamen"
}
variable "segmentoVNet" {
  description = "Segmento principal de la vnet"
  type = list(string)
  default = ["10.0.0.0/16"]
}
variable "segmentoVNetTwo" {
  description = "Segmento principal de la vnet"
  type = list(string)
  default = ["10.1.0.0/16"]
}
variable "segmentoSubNets" {
  description = "Segmento principal de las subnets"
  type = list(string)
  default = ["10.0.1.0/24","10.0.2.0/24","10.0.3.0/24"]
}