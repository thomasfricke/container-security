FROM docker.io/alpine:3.11
RUN apk add --update --no-cache curl  
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
RUN chmod +x kubectl && mv kubectl /usr/local/bin
COPY run.sh / 
RUN chmod +x /run.sh
ENTRYPOINT ["/run.sh"] 
