# Custom ChatGPT

Video Tutorial:

### Prerequisites

Before you start, you need to make sure you have Docker and Azure CLI installed in your local environment.

Here are the links to download and install Docker and Azure CLI:

1. [Docker](https://docs.docker.com/engine/install/)
2. [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)

### Installation

1. Clone this repository to your local machine.

```bash
git clone <repo_url>

```
2. Open terminal and execute the following commands (Please replace all placeholder fields marked by <> according to your settings.):
```bash
docker build -t <ChooseContianerName> .
az login
az group create --name <ChooseResourceGroupName> --location eastus
az acr create --resource-group <ChooseResourceGroupName> --name <ChooseAzureContainerRegistryName> --sku Basic
az acr login --name <ChooseAzureContainerRegistryName>
docker tag <ChooseContianerName>  <ChooseAzureContainerRegistryName>.azurecr.io/<ChooseContianerName>
docker push <ChooseAzureContainerRegistryName>.azurecr.io/<ChooseContianerName>

```
3.Open the docker-compose file to add your Azure Open AI base url and key, your created Azure container registry name and container image name.

4. Create Azure App Service Plan.

5. Execute the following command to create the Azure webapp :
```bash
az webapp create --resource-group <ChooseResourceGroupName> --plan <AzureAppPlanName>--name <ChooseWebAppName> --multicontainer-config-type compose --multicontainer-config-file docker-compose.yml

```
