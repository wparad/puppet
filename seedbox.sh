#!/usr/bin/env bash
# Run to generate a cert
certbot certonly --manual --preferred-challenges dns -d seedbox.warrenparad.net

# Add to cron
@reboot ~/.config/nginx/start
