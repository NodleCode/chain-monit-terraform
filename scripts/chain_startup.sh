#!/usr/bin/env bash

apt update
apt upgrade -y
groupadd -f nodle
useradd -m nodle -g nodle || echo "user already exists"
cd /tmp
curl -sSO https://dl.google.com/cloudagents/add-monitoring-agent-repo.sh
bash add-monitoring-agent-repo.sh
apt update -y
apt -y install stackdriver-agent
systemctl start stackdriver-agent
systemctl enable stackdriver-agent
curl -sSO https://dl.google.com/cloudagents/add-logging-agent-repo.sh
bash add-logging-agent-repo.sh
apt-get update -y
apt-get install -y google-fluentd
apt-get install -y google-fluentd-catch-all-config
systemctl start google-fluentd
systemctl enable google-fluentd
apt install -y htop emacs-nox wget

cat <<EOF > /lib/systemd/system/nodle-gateway.service
[Unit]
Description=Chain by Nodle
Wants=network-online.target
Requires=network-online.target
After=network-online.target

[Service]

User=nodle
Group=nodle
Restart=always
ExecStart=/usr/local/bin/nodle-chain --ws-external --rpc-cors all --chain main --name $HOSTNAME --pruning=archive --wasm-execution compiled --rpc-external
WorkingDirectory=/home/nodle
KillSignal=SIGINT
SyslogIdentifier=gateway

[Install]
WantedBy=multi-user.target
EOF
cd /usr/local/bin/
wget -O nodle-chain https://storage.googleapis.com/nofal-nodle-artifacts/chain/origin/tags/${CHAIN_TAG_VERSION}
chmod +x /usr/local/bin/nodle-chain
systemctl daemon-reload
systemctl start nodle-gateway
systemctl enable nodle-gateway