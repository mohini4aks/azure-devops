param clusterName string = 'mohini-poc'
param dnsPrefix string = 'mohini-poc'
param agentCount int = 1
param vmSize string = 'Standard_DS2_v2' // Change VM size as per your requirements
param osType string = 'Linux'
param kubernetesVersion string = '1.23.5' // Specify the version you need
param location string = resourceGroup().location

resource aksCluster 'Microsoft.ContainerService/managedClusters@2021-03-01' = {
  name: clusterName
  location: location
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    kubernetesVersion: kubernetesVersion
    dnsPrefix: dnsPrefix
    enableRBAC: true
    agentPoolProfiles: [
      {
        name: 'systempool'
        count: agentCount
        vmSize: vmSize
        osType: osType
        mode: 'System'
      }
    ]
  }
}

