FROM ubuntu:18.04
RUN apt-get update && apt-get install -y iptables openvpn curl jq mtr
COPY run.sh /
ENTRYPOINT ["/run.sh"] 
