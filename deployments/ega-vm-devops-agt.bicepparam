using '../modules/compute/virtual-machine/main.bicep'

param name = 'ega-vm-devops-agt'

param adminUsername = 'UsuarioPrueba'

param adminPassword = 'Pa$$w0rd12345'

param osType = 'Windows'

param vmSize = 'Standard_DS2_v2'
//param adminPassword = az.getSecret('subscriptionId', 'resource group', 'key vault', 'secreto')

param imageReference = {
  offer: 'WindowsServer'
  publisher: 'MicrosoftWindowsServer'
  sku: '2019-datacenter'
  version: 'latest'
}

param nicConfigurations = [
  {
    deleteOption: 'Delete'
    ipConfigurations: [
      {
        name: 'ipconfig01'
        pipConfiguration: {
          publicIpNameSuffix: '-pip-01'
        }
        subnetResourceId: '/subscriptions/72d501de-5778-4b23-8a81-33abfd22d159/resourceGroups/rg-networking/providers/Microsoft.Network/virtualNetworks/ega-vnet-hub/subnets/vm'
      }
    ]
    nicSuffix: '-nic-01'

  }
]

param osDisk = {
  caching: 'None'
  createOption: 'fromImage'
  deleteOption: 'Delete'
  diskSizeGB: '128'
  managedDisk: {
    storageAccountType: 'Standard_LRS'
  }
}

param encryptionAtHost = false

param tags = {
  Environment: 'Production'
  Owner: 'EGA'
}
