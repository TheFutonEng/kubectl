# This container is being used in a K8s job to bootstrap Hashicorp Vault according to the below doc:
# https://developer.hashicorp.com/vault/tutorials/kubernetes/kubernetes-cert-manager

FROM bitnami/kubectl:1.24.8 as kubectl
FROM alpine

# Copy the kubectl utility from the bitnami image.  Specifically targeting the same 
# image version as what is running in the Ubuntu cluster in WSP.
COPY --from=kubectl /opt/bitnami/kubectl/bin/kubectl /usr/local/bin/

# Install required utilities:
# jq - needed to parse vault initialization output
# curl - needed to upload CA PEM bundle to vault
RUN apk update && apk add jq curl