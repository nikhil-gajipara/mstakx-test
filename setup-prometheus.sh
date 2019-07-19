### execute below command during first time installation

# tar -xvzf helm-v2.8.2-linux-amd64.tar.gz
# sudo mv linux-amd64/helm /usr/bin
# helm repo add coreos https://s3-eu-west-1.amazonaws.com/coreos-charts/stable/

### execute below command for deployment of prometheus
helm install coreos/prometheus-operator --name prometheus-operator --namespace monitoring
helm install coreos/kube-prometheus --name kube-prometheus --set global.rbacEnable=true --namespace monitoring