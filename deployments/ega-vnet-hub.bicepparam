using '../modules/network/virtual-network/main.bicep'

param name = 'ega-vnet-hub'

param addressPrefixes = [
  '10.0.0.0/16'
]

param subnets = [
  {
    name: 'vm'
    addressPrefix: '10.0.2.0/24'
  }
  {
    name: 'private-endpoint'
    addressPrefix: '10.0.3.0/24'
  }
  {
    name: 'postgre'
    addressPrefix: '10.0.4.0/24'
    delegations: [
      {
        name: 'Microsoft.DBforPostgreSQL-flexibleServers'
        properties: {
          serviceName: 'Microsoft.DBforPostgreSQL/flexibleServers'
        }
      }
    ]
  }
  {
    name: 'logicapp'
    addressPrefix: '10.0.5.0/24'
    delegations: [
      {
        name: 'Microsoft.Web-serverfarms'
        properties: {
          serviceName: 'Microsoft.Web/serverfarms'
        }
      }
    ]
  }
  {
    name: 'cloud-services'
    addressPrefix: '10.0.6.0/24'
  }
]

param tags = {
  Environment: 'Production'
  Owner: 'EGA'
}
