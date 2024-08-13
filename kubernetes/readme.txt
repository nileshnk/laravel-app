Update the image url
Update the database connection envs

1. kubectl apply -f kube.ns.yaml
2. kubectl apply -f kube.app.staging.yaml

# Check if the service is created

    kubectl get svc
 
 Find the ClusterIP. 
 Curl into the clusterip along with port of the service;
 e.g curl 10.10.10.10:8080/
