# openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:2048 -keyout tls.key -out tls.crt -subj "/CN=silver.red-stone.awscloud.io/O=silver.red-stone.awscloud.io"
kubectl create secret tls tls-secret --key tls.key --cert tls.crt
kubectl apply -f ./ext-ingress.yaml