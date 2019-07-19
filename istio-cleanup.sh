helm delete --purge istio
helm delete --purge istio-init
kubectl delete ns istio-system