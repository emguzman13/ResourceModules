using '../modules/compute/virtual-machine/main.bicep'

param name = 'ega-vm-devops-agt'

param adminUsername = 'UsuarioPrueba'

param adminPassword = ''

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
        subnetResourceId: ''
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

param osType = 'Windows'
param vmSize = 'Standard_DS2_v2'

param tags = {
  Environment: 'Production'
  Owner: 'EGA'
}
