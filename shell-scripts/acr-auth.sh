#!/bin/bash

# Before running this script, specify correct values for the following 4 variables !!!!
AKS_RESOURCE_GROUP=SnowAKS
AKS_CLUSTER_NAME=AKSSnow
ACR_RESOURCE_GROUP=Containerization
ACR_NAME=nvpsamworkshop

# Get the id of the service principal configured for AKS
CLIENT_ID=$(az aks show --resource-group $AKS_RESOURCE_GROUP --name $AKS_CLUSTER_NAME --query "servicePrincipalProfile.clientId" --output tsv)

# Get the ACR registry resource id
ACR_ID=$(az acr show --name $ACR_NAME --resource-group $ACR_RESOURCE_GROUP --query "id" --output tsv)

# Create role assignment
az role assignment create --assignee $CLIENT_ID --role Reader --scope $ACR_ID

echo "CLIENT_ID_SP: $CLIENT_ID"
echo "ACR_ID: $ACR_ID"
