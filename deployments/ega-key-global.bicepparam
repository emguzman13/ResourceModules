using '../modules/key-vault/vault/main.bicep'

param name = 'ega-key-global'

param location = 'centralus'

param vaultSku = 'standard'

param publicNetworkAccess = 'Disabled'

param tags = {
  Environment: 'Production'
  Owner: 'EGA'
}
