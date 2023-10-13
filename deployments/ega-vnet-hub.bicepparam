using '../modules/network/virtual-network/main.bicep'

param name = 'ega-vnet-hub'

param addressPrefixes = [
  '10.0.0.0/16'
]

param subnets = [
  {
    name: 'postgre'
    addressPrefix: '10.0.4.0/24'
  }
]

param tags = {
  Environment: 'Production'
  Owner: 'EGA'
}
