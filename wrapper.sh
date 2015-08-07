#!/bin/bash
(. /templates/default.sh) > /etc/nginx/sites-available/default
cd /etc/nginx
exec nginx
