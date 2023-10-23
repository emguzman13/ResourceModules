using '../modules/compute/cloud-service/main.bicep'

param name = 'ega-clouds-test'

param configurationUrl = 'https://egastacloudservice.blob.core.windows.net/azureportaldeploy/ServiceConfiguration.Cloud-18b5a52320e.cscfg?sp=racw&st=2023-10-23T02:30:22Z&se=2023-10-23T10:30:22Z&spr=https&sv=2022-11-02&sr=b&sig=gyhiRPFLxuWT%2BYVjVh5tula5oisBpJVYwHRHY%2BJTKPA%3D'

param packageUrl = 'https://egastacloudservice.blob.core.windows.net/azureportaldeploy/CloudServiceTest-18b5a5223fb.cspkg?sp=racw&st=2023-10-23T02:29:20Z&se=2023-10-23T10:29:20Z&spr=https&sv=2022-11-02&sr=b&sig=bdGuxRlpvKRIyrBTy%2FZViyXqek%2F1SOYmtd4eu4MtYYQ%3D'

param roles = [
  {
    name: 'WebRole1'
    sku: {
      capacity: 1
      name: 'Standard_D1_v2'
      tier: 'Standard'
    }
  }
]

param loadBalancerConfigurations = [
  {
    name: 'ega-ilb-cls-test'
    properties: {
      frontendIpConfigurations: [
        {
          name: 'ega-ip-configurations'
          properties: {
            privateIPAddress: '10.0.6.100'
            subnet: {
              id: '/subscriptions/72d501de-5778-4b23-8a81-33abfd22d159/resourceGroups/rg-networking/providers/Microsoft.Network/virtualNetworks/ega-vnet-hub/subnets/cloud-services'
            }
          }
        }
      ]
    }
  }
]
param tags = {
  Environment: 'Production'
  Owner: 'EGA'
}
