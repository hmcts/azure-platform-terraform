variable "cosmos_account_name" {
  description = "Name of Cosmos DB Account. Must be less than 24 characters."
}

variable "resource_group_name" {
  description = "Your Cosmos DB needs to be in a resource group. Use the name of an existing group or use a new one to have one created."
}

variable "resource_group_location" {
  default     = "UK South"
  description = "Where you want your resource group to be. List of all current Azure locations https://azure.microsoft.com/en-gb/regions/services/"
}

variable "offer_type" {
  default     = "Standard"
  description = "Currently Standard is the only offer type available."
}

variable "kind" {
  default     = "GlobalDocumentDB"
  description = "This will either be 'GlobalDocumentDB' or 'MongoDB'"
}

variable "consistency_level" {
  default     = "Session"
  description = "DB Write Consistency. Most common is 'Session'.More Info: https://docs.microsoft.com/en-us/azure/cosmos-db/consistency-levels"
}

variable "failover_policy_location" {
  default     = "UK West"
  description = "Location of your second node is your failover pair or cluster."
}

variable "common_tags" {
  default = {}
}

variable "subnet_ids" {}