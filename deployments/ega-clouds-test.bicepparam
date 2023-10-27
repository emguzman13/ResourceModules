using '../modules/compute/cloud-service/main.bicep'

param name = 'ega-clouds-test'

param publicIpName = 'ega-clouds-test-pip'

param configurationUrl = 'https://egastacloudservice.blob.core.windows.net/azureportaldeploy/ServiceConfiguration.Cloud.cscfg?sp=racw&st=2023-10-27T23:35:21Z&se=2023-10-28T07:35:21Z&spr=https&sv=2022-11-02&sr=b&sig=AnNhYSLymSEwnMvLOfbm73MkT09ZRR5VqyXJmGdXVow%3D'

param packageUrl = 'https://egastacloudservice.blob.core.windows.net/azureportaldeploy/CloudServiceTest.cspkg?sp=r&st=2023-10-27T23:36:12Z&se=2023-10-28T07:36:12Z&spr=https&sv=2022-11-02&sr=b&sig=cJO3tMHAnpJirrrHrsFvK5a7hAdrJcZ%2BBvwDg8X%2B%2Bv4%3D'

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
  //public load balancer
  {
    name: 'ega-elb-cls-test'
    properties: {
      frontendIpConfigurations: [
        {
          name: 'ega-pip-configurations'
          properties: {
            publicIPAddress: {
              id: '/subscriptions/72d501de-5778-4b23-8a81-33abfd22d159/resourceGroups/rg-cloudservices/providers/Microsoft.Network/publicIPAddresses/ega-clouds-test-pip'
            }
          }
        }
      ]
    }
  }
  //private load balancer
  //{
  //  name: 'ega-ilb-cls-test'
  //  properties: {
  //    frontendIpConfigurations: [
  //      {
  //        name: 'ega-ip-configurations'
  //        properties: {
  //          privateIPAddress: '10.0.6.100'
  //          subnet: {
  //            id: '/subscriptions/72d501de-5778-4b23-8a81-33abfd22d159/resourceGroups/rg-networking/providers/Microsoft.Network/virtualNetworks/ega-vnet-hub/subnets/cloud-services'
  //          }
  //        }
  //      }
  //    ]
  //  }
  //}
]
param tags = {
  Environment: 'Production'
  Owner: 'EGA'
}
