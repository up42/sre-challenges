## generate_certificates.sh

Generates a Certificate Authority certifcate and a SSL certificate and key for the webserver.

Uses `certs/ca-config.txt` as a configuration for the CA and
`certs/validator-cert-config.txt` as a configuration for the webserver certificate.

The relevant files generated are:
* `rootCA.crt`: This file's contents will go into the `caBundle` parameter(base64-encoded) of the `ValidatingWebhookConfiguration` k8s resource. 
* `validator.key` and `validator.crt`: This is the key, and the certificate for the webserver.

The webserver certificate is issued to the DNS name `validator.default.svc`.

## build_docker_image.sh

Builds the docker image in the docker context of `minikube`


## deploy.sh

Should contain your code to automate terraform deployment of kubernetes manifests.

## /src

Should contain your webserver code and the Dockerfile for the webserver. 

## /terraform

Should contain all the terraform `.tf` files containing all the tf resources needed.
