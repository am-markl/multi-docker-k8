# Create the password as a token using the secrets object
# The key value pair is now set to PGPASSWORD,12345asdf. If you change the key here, be sure to change in server deployment and postgres deployment
kubectl create secret generic pgpassword --from-literal PGPASSWORD=12345asdf

# For instructions on how to deploy ingress:
# https://kubernetes.github.io/ingress-nginx/deploy/#prerequisite-generic-deployment-command

# Mandatory step to set up ingress
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/mandatory.yaml

# For minikube
minikube addons enable ingress

# For GCP GKE
# kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/provider/cloud-generic.yaml