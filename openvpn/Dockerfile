FROM alpine:3.10
RUN apk add --update --no-cache openvpn curl mtr jq 
COPY run.sh /
ENTRYPOINT ["/run.sh"] 
