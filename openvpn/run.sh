#!/bin/sh

iptables-restore < /etc/iptables/iptables.conf

PROTO=${PROTO:-tcp443}
COUNTRY=${COUNTRY:-Denmark}
COUNTRY_ID=$(curl --silent "https://api.nordvpn.com/v1/servers/countries" | jq --raw-output '.[] | select(.name == "'${COUNTRY}'") | .id ')
SERVER=$(curl --silent "https://api.nordvpn.com/v1/servers/recommendations?filters\[servers_groups\]&filters\[country_id\]=${COUNTRY_ID}&limit=1" \
        | jq --raw-output '.[].hostname')
curl -s https://downloads.nordcdn.com/configs/files/ovpn_legacy/servers/${SERVER}.${PROTO}.ovpn  \
 | sed 's+auth-user-pass+& /etc/vpn/passwd.conf+' > /tmp/server.ovpn

exec /usr/sbin/openvpn  --config /tmp/server.ovpn

