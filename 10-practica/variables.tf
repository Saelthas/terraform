# variable "common_tags" {
#   description = "Common Tags"
#   type        = string
# }
variable "vnet_name" {
  description = "vnet name"
  type        = string
  default = "rAruzamen-dev-net"
}
variable "addres_space" {
  description = "Segmento principal de la vnet"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}