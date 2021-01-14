set -ex

mkdir -p certs

#create key for root CA
openssl genrsa -des3 -out certs/rootCA.key 4096

# create root CA certificate
openssl req -new -x509 -key certs/rootCA.key -out certs/rootCA.crt -config certs/ca-config.txt

# create key for server certificate
openssl genrsa -out certs/validator.key 2048

# create csr for server certificate
openssl req -new -key certs/validator.key -out certs/validator.csr -nodes -config certs/validator-cert-config.txt

# create webserver certificate
openssl x509 -req -in certs/validator.csr -CA certs/rootCA.crt -CAkey certs/rootCA.key -CAcreateserial -out certs/validator.crt -days 500 -sha256
