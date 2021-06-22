#!/usr/bin/env bash
# Run to generate a cert
certbot certonly --manual --preferred-challenges dns -d seedbox.warrenparad.net

# Try to renew: https://whatbox.ca/wiki/Certbot_(Lets_Encrypt)_SSL_Certificates
source ~/virtualenv3/bin/activate
pip install certbot
certbot renew
aws --profile wparad route53 change-resource-record-sets --cli-input-json '{ "HostedZoneId": "Z2DHNS969RC3AX", "ChangeBatch": { "Changes": [ { "Action": "UPSERT", "ResourceRecordSet": { "Name": "_acme-challenge.seedbox.warrenparad.net", "Type": "TXT", "TTL": 60, "ResourceRecords": [ { "Value": "\"NEW_VALUE\"" } ] } } ] } }'

# Add to cron
@reboot ~/.config/nginx/start
