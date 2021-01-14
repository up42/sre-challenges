# point docker daemon to the minikube docker daemon
eval $(minikube -p minikube docker-env)

# build the docker image using that daemon
docker build -t validator ./src/


