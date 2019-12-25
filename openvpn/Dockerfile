FROM docker.io/alpine:3.11
RUN apk add --update --no-cache openvpn curl mtr jq 
COPY run.sh /
ENTRYPOINT ["/run.sh"] 
