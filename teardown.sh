helm delete mtest-r2 --purge 

helm delete mtest-r1 --purge

kubectl delete -f ./setup-ns.yaml

kubectl delete -f ./ext-ingress.yaml

helm delete nginx-ingress  --purge

kubectl delete secret tls-secret

./remove-prometheus.sh

./istio-cleanup.sh