# azureportalkubernetscostdashboard
# Azure Kubernetes Cost Dashboard

This project deploys an Azure Monitor Workbook that visualizes **Kubernetes cost by namespace**, and pins it to a shared Azure Dashboard. It uses **Azure Bicep** to automate the deployment.

---

## 📊 Features

- Cost by Namespace, Cluster, and Category (Compute, Storage, Networking)
- Time-filtered cost aggregation using Azure Cost Management API
- Dashboard-friendly layout with live links to Workbook

---

## 🚀 Prerequisites

- Azure CLI: [Install](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)
- Logged in to your Azure account:
  ```bash
  az login
