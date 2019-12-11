# Terraform Shutter module

The following module will deploy the necessary infrastructue for enaling the shutter page for applications. This module will provision the following:

    * Storage account for the shutter page
    * Enable Azure static website for the above storage account
    * Azure CDN profile
    * Azure CDN endpoint for each application
    * Azure custom domain attached to each endpoint
    * Enable CDN managed ssl certificates

## Usage

In order to use the module you need to follow the steps below in order:

**Step 1** A default shutter infrastructure is provided. If your application's shutter does not require any customization and want to re-use the default shutter page, add comma separated application's FQDN in the respective environments shutter tfvars file `environments/<env>/shutter.tfvars` page e.g.

```
shutter_apps = [
    "plum.sandbox.platform.hmcts.net"
]
```

**Step 2** If you want to use your own customized shutter page than create a file with the following naming convention inside `components/shutter` `module_<app-name>_shutter.tf`. Paste the following code in this file with proper values:  

```
module "<app>_shutter" {
  source              = "../../modules/shutter_page"
  resource_group_name = var.resource_group_name
  env                 = var.env
  shutter_storage     = var.<team>_shutter_storage
  shutter_apps        = var.<team>_shutter_apps
  cdn_sku             = var.cdn_sku
  common_tags         = local.common_tags
}
```

**Step 3** If there is already a `shutter.tfvars` file inside `environments/<env>/` directory then use the same file else create a new `shutter.tfvars` file.

create the following variables in the file

```
# This is to create a storage account for your teams shutetr page that can be used for multiple applications.

<team>_shutter_storage = "<team_name>"

# comma separated FQDN that needs to have the shutter page from the above storage account.
<team>_shutter_apps = [
    "plum.sandbox.platform.hmcts.net"  
]
```

**Step 4** (Optional) If you are creating a new `shutter.tfvars` file then copy the below variables

```
# Common variables - do not change these

env                 = "sbox"
cdn_sku             = "Standard_Verizon"
resource_group_name = "shutter-app-rg"

# This is to create a storage account for your teams shutter page that can be used for multiple applications.

<team>_shutter_storage     = "<team-name"

# comma separated FQDN that needs to have the shutter page from the above storage account.

<team>_shutter_apps = [
    "plum.sandbox.platform.hmcts.net"
]
```

**Step 5** Create the variable declaration at `components/shutter/variables.tf ` as below:

```
variable "<team>_shutter_storage" {}
variable "<team>_shutter_apps" {}
```

**Step 6** Create a PR with the above and mark it for review with Platform Engineering team.

**Step 7** Once merged you should have your infrastructure created for your application's shutter page.