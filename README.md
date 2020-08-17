# 環境変数について

アプリケーションの動作には下記環境変数が必要
ローカルでは以下の変数はgoogle-credentials.jsonと.envと.sec_envに定義されており、そこから変数が供給される。
GitHub ActionではGitHubのSecretsで定義されているので特に何もする必要はない。

```
APP_URL
APP_NAME
DB_HOST
DB_NAME
DB_PASS
DB_PORT
DB_USER
GCP_CLIENT_EMAIL
GCP_CLIENT_ID
GCP_CLIENT_X509_CERT_URL
GCP_PRIVATE_KEY
GCP_PRIVATE_KEY_ID
GCP_PROJECT_ID
RAILS_ENV
SECRET_KEY_BASE
```

加えてDigitalOceanにデプロイする際には下記変数もGitHub Actionで必要

```
DIGITALOCEAN_ACCESS_TOKEN
DOCKER_PASSWORD
DOCKER_USERNAME
```
# Prepare Clusters

## Local

```
cd kube
kubectl create secret generic itizen-credentials --from-env-file ../.env 
kubectl apply -f db-preparation.yml
kubectl apply -f dev.yml		
kubectl apply -f lb.yml		
kubectl apply -f main.yml
helm repo add stable https://kubernetes-charts.storage.googleapis.com/
helm install nginx-ingress stable/nginx-ingress --set controller.publishService.enabled=true
```

## DigitalOcean (production)


Fill the credentials in ../.env-prd

```
cd kube
# update kubectl config
doctl kubernetes cluster kubeconfig save itinitiitizen
# env
# don't forget to update `RAILS_ENV=production`
kubectl create secret generic itizen-credentials --from-env-file ../.env
kubectl apply -f db-preparation.yml
kubectl apply -f lb.yml
kubectl apply -f main.yml
helm repo add stable https://kubernetes-charts.storage.googleapis.com/
helm install nginx-ingress stable/nginx-ingress --set controller.publishService.enabled=true
```

Edit your hosts or dns point to ingress load balancer.

Install TLS

```
kubectl apply --validate=false -f https://github.com/jetstack/cert-manager/releases/download/v0.16.1/cert-manager.crds.yaml
kubectl create namespace cert-manager
helm repo add jetstack https://charts.jetstack.io
helm install cert-manager --version v0.16.1 --namespace cert-manager jetstack/cert-manager
kubectl apply -f production_issuer.yml
```

Install Datadog Agent

```
helm install datadog-agent -f datadog-values.yaml --set datadog.site='datadoghq.com' --set datadog.apiKey=(API KEY) stable/datadog
```
