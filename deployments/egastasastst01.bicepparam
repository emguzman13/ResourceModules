using '../modules/storage/storage-account/main.bicep'

param name = 'egastasastst01'

param kind = 'StorageV2'

param skuName = 'Standard_LRS'

param enableHierarchicalNamespace = true

param networkAcls = {
  bypass: 'AzureServices'
  defaultAction: 'Deny'
  ipRules: [
    {
      action: 'Allow'
      value: '187.190.154.239'
    }
  ]
}

param tags = {
  Environment: 'Production'
  Owner: 'EGA'
}
