General Guideline
    * Please note that to execute entire script, i am using Windows Ubuntu system terminal
    * Please note that instaling kubernetes over VM is not covered in the test due to time      availability.
    * This script have been tested on IBM and Azure kubernetes service.
    * Use below given command to push image into private artifactory
        docker login <<Registy Name>> -u YOUR_USER_ID_HERE -p YOUR_API_KEY_HERE
    * Use below given command to create image pull secret in K8s namespace    
        kubectl create secret docker-registry <<registry-name>> --docker-server=<registry-server-name> --docker-username=<user_name> --docker-password=<user_password> --docker-email=<user_email>

Prerequisite
1. Install kubectl on terminal from where we connect to the Kubernetes
2. Run below given curl command to download istio setup
    curl -L https://git.io/getLatestIstio | ISTIO_VERSION=1.2.2 sh -

    Note: Make sure istio folder should be available within script folder
     
3. Run below given script to install helm and tiller
    ./setup-helm.sh

Deployment 
1. Run below give script to deploy following components. 
    ./setup.sh
    
    Script will deploy following components in the same order
    1. istio 1.2.2 and enabled following monitoring service mesh tools
        1. Grafana
        2. Killi
        3. Tracing
    2. Install nginx ingress controller latest version
    3. Create new namespace "silver"
    4. enabled istio proxy
    5. deploye httpecho application APIs (POD and Service) - version V1
    6. deploye destination rule for creating subset for each version of API
    7. deploye gateway and virtual service to route request to appropriate version / app
    8. deploye kubernetes nginx ingress (external ingress)
    9. Create new namespace "monitoring"
    10. deploy promethius for collecting matrix for host / container

Teardown
1. Run below given script to remove all components
    ./teardown.sh