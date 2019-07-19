./istio-deploy.sh

helm install stable/nginx-ingress --name nginx-ingress --set controller.publishService.enabled=true --set controller.extraArgs.enable-ssl-passthrough=""

kubectl apply -f ./setup-ns.yaml

### Enable istio proxy
kubectl label namespace silver istio-injection=enabled

helm upgrade --install mtest-r1 mtest --namespace "silver" --set-string image.tag=v1 --set-string deployment.version=v1 --set-string service.enabled=true

helm upgrade --install mtest-r2 mtest --namespace "silver" --set-string image.tag=v2 --set-string deployment.version=v2 --set-string service.enabled=false

./setup-ext-ingress.sh

./setup-prometheus.sh