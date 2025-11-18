
variable "location" {
  description = "Enter Azure location"
  type        = string
}
variable "frontends" {}
variable "env" {
  description = "Enter the environment. eg prod, aat"
  type        = string
}

variable "product" {
  description = "The name of the product."
  type        = string
}
variable "builtFrom" {
  description = "The name of the Github repo."
}

variable "expiresAfter" {
  description = "Expiration date"
  default     = "3000-01-01"
}
#variable "environment" {}

variable "sku_tier" {
  description = "SKU tier of the Static Web App"
}
variable "sku_size" {
  description = "SKU size of the Static Web App"
}