module "log_analytics_workspace" {
  source      = "git::https://github.com/hmcts/terraform-module-log-analytics-workspace-id.git?ref=DTSPO-75-add-more-workspaces"
  environment = var.env
}
