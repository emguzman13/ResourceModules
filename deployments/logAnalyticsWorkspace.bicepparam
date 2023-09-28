using '../modules/operational-insights/workspace/main.bicep'

param name = 'ega-law-company'

param dataRetention = 30

param tags = {
  Environment: 'Production'
  Owner: 'EGA'
}
