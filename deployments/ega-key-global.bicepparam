using '../modules/key-vault/vault/main.bicep'

param name = 'ega-key-global'

param vaultSku = 'standard'

param enableRbacAuthorization = true

param networkAcls = {
  bypass: 'AzureServices'
  defaultAction: 'Deny'
  ipRules: []
}

param tags = {
  Environment: 'Production'
  Owner: 'EGA'
}
