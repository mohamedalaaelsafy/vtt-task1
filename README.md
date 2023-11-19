
# Task 1

Technical task 1


## Version used

Terraform v1.3.0

## Installation

**To deploy this project run follow the bellow steps**

Terraform
```bash
cd terraform  
```
```bash
terraform init
```
```bash
terraform apply
```
Connect to cluster
```bash
gcloud container clusters get-credentials vtt-cluster --zone us-central1-c --project vodafone-technical-task
```

Create namespace

```bash
kubectl create ns dev 
```
```bash
kubectl create ns shared-services
```
Install helm charts 
```bash
cd resources
```
```bash

helm dependency update web-app && helm install web-app web-app --namespace dev
```
```bash
helm dependency update ingress &&  helm install ingress ingress --namespace dev
```
***--> https://angular.ma-devops.com*** (make sure that everything is provissioned before testing this url, estimated: about 15-30 min)

```bash
helm dependency update jenkins && helm install jenkins jenkins --namespace shared-services 
```
```bash
helm dependency update redis && helm install redis redis --namespace shared-services 
```
For Jenkins
```bash
kubectl -n shared-services port-forward deployment/jenkins 9000:8080
```
***--> http://localhost:9000***

**To destroy this project** 

Remove helm charts
```bash
helm uninstall wep-app --namespace dev
```
```bash
helm uninstall ingress --namespace dev
```
```bash
helm uninstall jenkins --namespace shared-services
```
```bash
helm uninstall redis --namespace shared-services 
```

Destroy infrastructure

```bash
cd terraform 
```
```bash
terraform destroy 
```