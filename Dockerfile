FROM bitnami/kubectl:1.24.8 as kubectl
FROM alpine

# Copy the kubectl utility from the bitnami image.  Specifically targeting the same 
# image version as what is running in the Ubuntu cluster in WSP.
COPY --from=kubectl /opt/bitnami/kubectl/bin/kubectl /usr/local/bin/

# RUN adduser -D rmengert
# USER rmengert

RUN apk update && apk add jq curl