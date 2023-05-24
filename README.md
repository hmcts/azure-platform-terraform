# common-platform-terraform

All things terraform

## Pre-commit Installation
This repository has been configured with pre-commit hooks. To install pre-commit see its [installation guide](https://pre-commit.com/#installation)

For this repository you will also need these dependencies: 

- [terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)
- [yq](https://github.com/mikefarah/yq#install)


## Frontdoor

To setup a basic Frontdoor configuration, go to the required environment within `environments` folder and edit the environments `tfvars` file

Within the variable `frontends` add the basic object to the array:
```terraform
{
  name              = "{Sub-Domain Name}"
  custom_domain     = "{URL}"
  backend_domain    = ["{Backend URL or Firewall}"]
  disabled_rules    = {}
  global_exclusions = []
}
```

### WAF Exclusions
If you have blocks on the Web Application Firewall(WAF) you may want to exclude them to allow traffic.
Please first see if the block is really required to exclude and if there is an alternative route first to keep as much protection in place.

To exclude add the parameter `global_exclusions`, which is an array of exclusions.
Each exclusion is formatted as:
```terraform
{
  match_variable = "BLOCK TYPE"
  operator       = "OPERATOR"
  selector       = "VALUE"
}
```

`BLOCK TYPE` 
| Variable | Description |
| -- | -- |
| RequestCookieNames | Cookie Name |
| QueryStringArgNames | Query String Argument |
| RequestBodyPostArgNames | Property within the Request Body |
| RequestHeaderNames | Header Parameter Name |

`OPERATOR`
| Operator | Description |
| -- | -- |
| Equals | Matches value |
| StartsWith | Starts with string |
| EndsWith | Ends with string |
| Contains | Contains String |

`VALUE` 
string being blocked.

### TLS
By default it will use the Azure Frontdoor Managed Certificates, which will validate the URL against the DNS within the tenant then generate a certificate.

If you would like to use a certificate from the ACME Key Vaults managed by Platform Operations, then you can add the following properties:
```terraform
{
  certificate_name = "{Certificate Name}"
  ssl_mode         = "AzureKeyVault"
}
```

## Shutter Pattern
These are details on how to setup the Shuttern Pattern within this repository.<br/>
You can get more detail from [shutter-implementation-and-design](https://hmcts.github.io/ways-of-working/path-to-live/shutter.html#shutter-implementation-and-design)

Setting the below parameter within the `frontends` object array will tell the pipeline to create the storage account and CDN.

**Example**
```terraform
{
    name              = "my-application-name"
    custom_domain     = "my-application-name.platform.hmcts.net"
    backend_domain    = ["firewall-prod-int-palo-sdsprod.uksouth.cloudapp.azure.com"]
    shutter_app       = true
    disabled_rules    = {}
    global_exclusions = []
  }
```

The storage account name will remove the `-` and take the first `8` characters of the `name` property. For example if the `name` was set to `my-application-name` then the storage account would use `myapplic` and be called `hmctsmyapplicshutterprod`.

You can then forward the website manually to the shutter by setting the `shutter: true` in the `azure-public-dns` repository.

### TLS
The shuttering service currently requires an ACME certificate, you will need to add the `certificate_name` field:
```terraform
{
  certificate_name = "{Certificate Name}"
}
```

## Custom Data Updates
Please note that custom_data updates will cause VMs to restart.

For example updates to [cloudconfig-private.tpl](https://github.com/hmcts/azure-platform-terraform/blob/master/modules/dynatrace-activegate/cloudconfig-private.tpl) & [cloudconfig.tpl](https://github.com/hmcts/azure-platform-terraform/blob/master/modules/dynatrace-activegate/cloudconfig.tpl)
