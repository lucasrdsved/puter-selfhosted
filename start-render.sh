#!/bin/bash

# Create config directory if it doesn't exist
mkdir -p /opt/render/project/src/volatile/config

# Create production config
cat > /opt/render/project/src/volatile/config/config.json << 'EOF'
{
    "config_name": "render production",
    "env": "production",
    "nginx_mode": false,
    "http_port": 4100,
    "host": "0.0.0.0",
    "domain": "0.0.0.0",
    "protocol": "https",
    "custom_domains_enabled": true,
    "enable_hosts_api": true,
    "allowed_origins": "*",
    "services": {
        "database": {
            "engine": "sqlite",
            "path": "/opt/render/project/src/volatile/runtime/puter-database.sqlite"
        },
        "thumbnails": {
            "engine": "purejs"
        }
    }
}
EOF

# Start Puter
npm start
