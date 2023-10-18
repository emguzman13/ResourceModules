using '../modules/resources/resource-group/main.bicep'

param name = 'rg-cloudservices'

param location = 'centralus'

param tags = {
  Environment: 'Production'
  Owner: 'EGA'
}
