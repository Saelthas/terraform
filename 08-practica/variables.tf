variable "rg_name" {
  description = "Nombre del grupo de recursos"
  type        = string
  default     = "rAruzamen-rg"
}
variable "location" {
  default = "East US"
}
variable "segmentoVNet" {
  description = "Segmento principal de la vnet"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}
variable "environment" {
  description = "entorno de ejecucion"
  type        = string
  default     = "qa"
}
variable "project_name" {
  description = "nombre del proyecto"
  type        = string
  default     = "TFCourse"
}
variable "allocation_method" {
  description = "nombre del proyecto"
  type        = string
  default     = "Static"
}
variable "sku" {
  description = "nombre del proyecto"
  type        = string
  default     = "Standard"
}
variable "allowedIp" {
  description = "nombre del proyecto"
  type        = string
  default     = "181.115.171.206/32"
}