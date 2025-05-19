param location string = resourceGroup().location
param dashboardName string = 'aks-cost-dashboard'
param workbookResourceId string

resource dashboard 'Microsoft.Portal/dashboards@2020-09-01-preview' = {
  name: dashboardName
  location: location
  properties: {
    lenses: {
      "0": {
        order: 0
        parts: {
          "0": {
            position: {
              x: 0
              y: 0
              rowSpan: 5
              colSpan: 6
            }
            metadata: {
              inputs: [
                {
                  name: "resourceId"
                  value: workbookResourceId
                }
              ]
              type: "Extension/HubsExtension/PartType/Workbook"
              settings: {
                content: {
                  settings: {
                    workbookId: workbookResourceId
                  }
                  filterSettings: {}
                }
              }
            }
          }
        }
      }
    }
    metadata: {
      model: {
        timeRange: {
          value: {
            relative: "24h"
          }
          type: "MsPortalFx.Composition.Configuration.ValueTypes.TimeRange"
        }
      }
    }
  }
}
