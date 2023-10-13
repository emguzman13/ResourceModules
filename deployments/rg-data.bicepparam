using '../modules/resources/resource-group/main.bicep'

param name = 'rg-data'

param location = 'centralus'

param tags = {
  Environment: 'Production'
  Owner: 'EGA'
}
