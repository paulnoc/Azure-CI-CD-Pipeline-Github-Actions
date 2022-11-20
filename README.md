[![ML API Continuous Integration](https://github.com/paulnoc/PaulNO-ML-api-CICD/actions/workflows/main.yml/badge.svg)](https://github.com/paulnoc/PaulNO-ML-api-CICD/actions/workflows/main.yml)



# Overview

This project is a complete solution of a python-based Machine Learning model that predicts the prices of houses in Boston. The application was built to run using Azure App Services on Microsoft Azure Platform as a Service (PaaS).

The source control management system adopted is GitHub and GitHub Actions as build server for Continuous Integration (CI). Latest changes were recorded by enabling Continuous Delivery (CD) using Azure pipelines.



# Project Plan

Agile methodologies were employed in managing the project. Details of the project phases and planning can be found in the links below:

* A [link](https://trello.com/b/qflJcQWC/ci-cd-for-ml-app) to a Trello board for monitoring the project.
* A [link](./pno-project-plan.xlsx) to a spreadsheet that captures the project plan



# Instructions

![Architectural Diagram](./images/ci-cd-architecture-azure.png)

In order to recreate the CICD pipeline, follow the steps detailed below.

* Clone the repository into Azure Cloud Shell and change directory
![Cloning into Azure Cloud Shell](./images/clone-repo.png)

* Create and activate a virtual environment using the Make command (`make setup`)
```
make setup
```
![Create virtual environment](./images/create-virtual-env.png)

* Install dependencies using the Make command (`make install`)
```
make install
```
![Install dependencies](./images/install.png)

* Lint code and run unit test using the Make command (`make lint`, `make test`)
```
make lint
```
```
make test
```
![Lint and Test](./images/make-lint-test.png)

NOTE: The `make all` command executes all the commands above

* Run the app (locally) and test by making an API call from a new terminal
```
python app.py
```
![Run app locally](./images/run-app.png)

```
sh ./make_prediction.sh
```
![Make API call to locally run app](./images/prediction.png)

* Deploy the app as an Azure WebApp and make requests to the API
```
az webapp up --name <app_name> --resource-group <resource_group_name> --runtime "PYTHON:3.7"
```
![Deploy as WebApp](./images/webapp-deploy.png)

![App Home Page](./images/app-homepage.png)

ONow make an API request using the command
NOTE: Change the url in the file 'make_predict_azure_app.sh'
```
sh ./make_predict_azure_app.sh
``` 
![Make request to the WebApp](./images/prediction_from_webapp.png)

Logs from the running application can be viewed here
```
https://<app-name>.scm.azurewebsites.net/api/logs/docker
```
![Logs from the WebApp](./images/application-logs.png)

Configure Azure pipelines following the documented steps:
[Refer to the official documentation as you setup CI/CD](https://docs.microsoft.com/en-us/azure/devops/pipelines/ecosystems/python-webapp?view=azure-devops)

* Create a Devops Project
![Devops Project](./images/devops-project.png)

* Create a Service Connection
![Service Connection](./images/AzureDevops-project-service-connection.png)

* Create a Agent Pool
![Agent Pool](./images/agent-pool.png)

* Create Azure Pipeline
![Azure Pipeline](./images/pipeline.png)

* Run Pipeline
![Deploy using Pipeline](./images/pipeline-run.png)

* Load test using Locust
![Load Test](./images/load-test-using-locust.png)



# Demo 

https://www.youtube.com/watch?v=hGzCNbvsjpw



# Alternative deployment

Kubernetes can be used to deploy this app (containerized as a Docker app). This approach would provide a resilient environment and smoothen the deployment process.




