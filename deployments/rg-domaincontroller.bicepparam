using '../modules/resources/resource-group/main.bicep'

param name = 'rg-domaincontroller'

param location = 'centralus'

param tags = {
  Environment: 'Production'
  Owner: 'EGA'
}
