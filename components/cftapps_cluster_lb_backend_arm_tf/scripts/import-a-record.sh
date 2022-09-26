#!/bin/bash
set -e

# Example
# ENV="ithc"
# SUBSCRIPTION_ID="1baf5470-1c3e-40d3-a6f7-74bfbce4b348"
# RESOURCE_GROUP="core-infra-intsvc-rg"
# PRIVATE_DNS_ZONE="service.core-compute-ithc.internal"

ENV="prod"
SUBSCRIPTION_ID="1baf5470-1c3e-40d3-a6f7-74bfbce4b348"
RESOURCE_GROUP="core-infra-intsvc-rg"
PRIVATE_DNS_ZONE="service.core-compute-prod.internal"

PRODUCTS=()
COMPONENTS=()
PRODUCTS+=($(yq e '.gateways[].app_configuration[].product' "../../../environments/$ENV/backend_lb_config.yaml"))
COMPONENTS+=($(yq e '.gateways[].app_configuration[].component' "../../../environments/$ENV/backend_lb_config.yaml"))

for i in "${!PRODUCTS[@]}"; do

PRODUCT_COMPONENT=("${PRODUCTS[i]}"-"${COMPONENTS[i]}"-"$ENV")
RESOURCE=()

RESOURCE=($(az network private-dns record-set a list -g $RESOURCE_GROUP -z $PRIVATE_DNS_ZONE --query "[?id=='/subscriptions/$SUBSCRIPTION_ID/resourceGroups/$RESOURCE_GROUP/providers/Microsoft.Network/privateDnsZones/$PRIVATE_DNS_ZONE/A/$PRODUCT_COMPONENT']" -o tsv))

# if [ -n "$RESOURCE" ]
# then
#     terraform import module.privatedns.azurerm_private_dns_a_record.this[\"$PRODUCT_COMPONENT\"]  /subscriptions/$SUBSCRIPTION_ID/resourceGroups/$RESOURCE_GROUP/providers/Microsoft.Network/privateDnsZones/$PRIVATE_DNS_ZONE/A/$PRODUCT_COMPONENT
# else
#     echo $PRODUCT_COMPONENT has no record in $PRIVATE_DNS_ZONE to import
# fi

done