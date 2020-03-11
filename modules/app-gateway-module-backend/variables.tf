variable "yaml_path" {
  description = "path to yaml config file"
}

variable "env" {
  description = "environment, will be used in resource names and for looking up the vnet details"
}

variable "subscription" {
  description = "subscription, will be used for looking up the keyvault details"
}

variable "vault_name" {
  description = "vault name"
}

variable "location" {
  description = "location to deploy resources to"
}

variable "min_capacity" {
  default = 2
}

variable "max_capacity" {
  default = 10
}

variable "private_ip_address" {
  description = "IP address to allocate staticly to app gateway, must be in the subnet for the env"
}