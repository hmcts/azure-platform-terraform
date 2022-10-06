#!/bin/bash
set -e

ENV="prod"
SUBSCRIPTION_ID="1baf5470-1c3e-40d3-a6f7-74bfbce4b348"
RESOURCE_GROUP="core-infra-intsvc-rg"
PRIVATE_DNS_ZONE="service.core-compute-prod.internal"

PRODUCTS=()
COMPONENTS=()
PRODUCTS+=($(yq e '.gateways[].app_configuration[].product' "../../environments/$ENV/backend_lb_config.yaml"))
COMPONENTS+=($(yq e '.gateways[].app_configuration[].component' "../../environments/$ENV/backend_lb_config.yaml"))

for i in "${!PRODUCTS[@]}"; do

PRODUCT_COMPONENT=("${PRODUCTS[i]}"-"${COMPONENTS[i]}"-"$ENV")
echo $PRODUCT_COMPONENT
RESOURCE=()

RESOURCE=($(az network private-dns record-set a list -g $RESOURCE_GROUP -z $PRIVATE_DNS_ZONE --query "[?id=='/subscriptions/$SUBSCRIPTION_ID/resourceGroups/$RESOURCE_GROUP/providers/Microsoft.Network/privateDnsZones/$PRIVATE_DNS_ZONE/A/$PRODUCT_COMPONENT']" -o tsv))

 if [ -n "$RESOURCE" ]
 then
    terraform import -var builtFrom="https://github.com/hmcts/azure-platform-terraform.git" -var privatedns_subscription="1baf5470-1c3e-40d3-a6f7-74bfbce4b348" -var subscription="8cbc6f36-7c56-4963-9d36-739db5d00b27" -var data_subscription="8999dec3-0104-4a27-94ee-6588559729d1" -var oms_env="prod" -var product=cft-platform -var env=prod  azurerm_private_dns_a_record.appgw[\"$PRODUCT_COMPONENT\"]  /subscriptions/$SUBSCRIPTION_ID/resourceGroups/$RESOURCE_GROUP/providers/Microsoft.Network/privateDnsZones/$PRIVATE_DNS_ZONE/A/$PRODUCT_COMPONENT
  else
     echo $PRODUCT_COMPONENT has no record in $PRIVATE_DNS_ZONE to import
 fi

done