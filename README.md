# CustomChatGPT
1.	Clone this repo
2.	Make sure you have Docker and Azure CLI:
a.	https://docs.docker.com/engine/install/
b.	https://learn.microsoft.com/en-us/cli/azure/install-azure-cli
3.	Open terminal to run this step:
a.	docker build -t <ChooseContianerName> .
b.	az login
c.	az group create - name <ChooseResourceGroupName> - location eastus
d.	az acr create --resource-group <ChooseResourceGroupName> --name <ChooseAzureContainerRegistryName> --sku Basic
e.	az acr login --name <ChooseAzureContainerRegistryName>
f.	docker tag <ChooseContianerName>  <ChooseAzureContainerRegistryName>.azurecr.io/<ChooseContianerName>
g.	docker push <ChooseAzureContainerRegistryName>.azurecr.io/<ChooseContianerName>
4.	Open docker-compose file to add your Azure Open AI base url and key, your created Azure container registry name and container image name
5.	Create Azure Web Plan
6.	az webapp create --resource-group <ChooseResourceGroupName> --plan <AzureWebPlanName>--name <ChooseWebAppName> --multicontainer-config-type compose --multicontainer-config-file docker-compose.yml

