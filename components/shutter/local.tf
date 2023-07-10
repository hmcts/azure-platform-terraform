locals {
  # List of apps to deploy shuttering infra for. 
  shutter_apps = [for k, v in var.frontends : v if lookup(v, "shutter_app", true)]
}