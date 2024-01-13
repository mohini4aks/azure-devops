param location string = 'Central US'
resource storageaccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: 'storageaccount'
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Standard_ZRS'
  }
  properties: {
    accessTier: 'Cool'

  }
}
