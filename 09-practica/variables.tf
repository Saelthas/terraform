variable "common_tags" {
  description = "Common Tags"
  type        = map(string)
}
variable "vnet_name" {
  description = "vnet name"
  type        = string
}
variable "addres_space" {
  description = "Segmento principal de la vnet"
  type        = list(string)

}