variable "env" {}
variable "project" {}
variable "common_tags" {
    default = {
    "managedBy"          = "Platform Engineering"
    "solutionOwner"      = "CFT"
    "activityName"       = "AKS"
    "dataClassification" = "Internal"
    "automation"         = ""
    "costCentre"         = "10245117" // until we get a better one, this is the generic cft contingency one
    "environment"        = "sbox"
    "criticality"        = "Medium"
  }
}
variable "aks" {}
variable "firewall" {}