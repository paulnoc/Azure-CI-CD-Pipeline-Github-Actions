git clone git@github.com:paulnoc/PaulNO-ML-api-CICD.git
cd PaulNO-ML-api-CICD
make all
az webapp up --name pnomlapi --resource-group Azuredevops --runtime "PYTHON:3.7"
