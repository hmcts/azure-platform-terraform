# Migrating to Availability Zone-Enabled Access Gateway  

## Implementation (No downtime)

### Create AZ-enabled frontend/backend application gateway resources

- Identify available IP addresses for the new frontend and backend application gateways
- Update the environment <env>.tfvars file and add values for the below variables  
    
  `frontend_agw_private_ip_address = "<frontend ip address>"`
   `backend_agw_private_ip_address = ["<backend ip address>"]`  

- Create Azure DevOps pipeline stages for the new `frontendappgateway` and `backendappgateway` components. See [sbox pipeline stages example](https://github.com/hmcts/azure-platform-terraform/blob/master/azure_pipeline.yaml#L47-L61)
- Run [azure-platform-terraform pipeline plan](https://dev.azure.com/hmcts/CNP/_build?definitionId=235) and confirm the terraform plans for the new appgateway components are correct.  
  Also confirm there are no changes in the terraform plans for the existing `cftapps_cluster_lb` and `cftapps_cluster_lb_backend` appgateway components
- Run the `azure-platform-terraform` pipeline in apply mode to create the new `frontendappgateway` and `backendappgateway` components 

### Create Azure Firewall and Palo Alto entries

#### Azure Firewall  
- Update the environment `tfvars` [file](https://github.com/hmcts/rdo-terraform-hub-dmz/tree/1b47237e07a759fb05c74adf749e4749d8f88b8c/env_tfvars) and add an entry for the new `frontendappgateway`  
  See [sbox example](https://github.com/hmcts/rdo-terraform-hub-dmz/blob/1b47237e07a759fb05c74adf749e4749d8f88b8c/env_tfvars/hub-sbox-int.tfvars#L59-L66)  
  Note:   
  - name: Append `-2` suffix to the environment name (though sbox example shown uses a `-test` suffix)  
  - palo_ips: IP address for the new `frontendappgateway`. Specify same values for both uksouth and ukwest
  - index: Pick the next available number
  
- Once merged, the new entry will create the following in both uksouth and ukwest
  - A `public IP address` associated with the regional Azure firewall
  - A destination NAT `NAT rule collection` entry translating inbound traffic (from Azure Frontdoor) to the newly created public IP to `frontendappgateway' private IP address  

#### Palo Alto
- Update the `hub-pan-baseline.j2` configuration file with the following
  - Locate the server object entry (`name/ip address`) for the current frontend application gateway. Directly below this entry, add a server object for the new `frontendappgateway` using a `-2` name suffix   
  - Locate the address group object entry (`<member>AKS-<env>-APPGW</member>`) for the current frontend application. Add an entry for server object created above 



### Create Azure Firewall and Palo Alto Entries for FrontEnd appgatewy

### Create Azure Firewall and Palo Alto Entries for FrontEnd appgatewy