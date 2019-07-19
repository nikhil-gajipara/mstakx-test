helm delete prometheus-operator --purge
helm delete kube-prometheus --purge
kubectl delete namespace monitoring