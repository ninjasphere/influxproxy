#!/bin/bash
cat <<EOF
server {
	listen 18086 default_server;

	location / {
		 add_header Authorization Basic\ $(echo "$INFLUX_USER:$INFLUX_PASSWORD"|base64);
		 rewrite_log on;
		 rewrite ^(.*)$ \$1?u=${INFLUX_USER}&p=${INFLUX_PASSWORD} break;
		 proxy_pass ${INFLUX_URL};
		 proxy_set_header Host ${INFLUX_HOST};
		 proxy_redirect off;
    }
}
EOF
