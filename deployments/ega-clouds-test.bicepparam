using '../modules/compute/cloud-service/main.bicep'

param name = 'ega-clouds-test'

param publicIpName = 'ega-clouds-test-pip'

param configurationUrl = 'https://egastacloudservice.blob.core.windows.net/azureportaldeploy/ServiceConfiguration.Cloud.cscfg?sp=r&st=2023-11-07T20:04:16Z&se=2024-02-01T04:04:16Z&spr=https&sv=2022-11-02&sr=b&sig=8wFBM22crQH3jUHcaLbIE5%2F%2FQb7XQOkWMKoaPb9uWUE%3D'

param packageUrl = 'https://egastacloudservice.blob.core.windows.net/azureportaldeploy/CloudServiceTest.cspkg?sp=r&st=2023-11-07T20:03:18Z&se=2024-02-01T04:03:18Z&spr=https&sv=2022-11-02&sr=b&sig=EyPQvyNndZtmstkA%2BVuXRbosWk1SIrKmigeNNW56dMU%3D'

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
