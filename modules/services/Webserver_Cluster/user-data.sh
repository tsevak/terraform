#!/bin/bash
cat > index.html <<EOF
<h1>Welcome to my webserver</h1>
<p>MYSQL DATABASE CONNECTION ADDRESS: ${db_address}</p>
EOF

nohup busybox httpd -f -p ${web_server_port} &