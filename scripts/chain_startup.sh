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
wget -O nodle-chain https://storage.googleapis.com/nodle-chain-artifacts/chain/origin/tags/${CHAIN_TAG_VERSION}
chmod +x /usr/local/bin/nodle-chain
systemctl daemon-reload
systemctl start nodle-gateway
systemctl enable nodle-gateway
sleep 10
systemctl stop nodle-gateway
cd /home/nodle/.local/share
wget https://storage.googleapis.com/nodle-chain-artifacts/chain-backup/latest.tar.gz
tar xzf latest.tar.gz
rm -f latest.tar.gz
chown -R nodle:nodle *
cd -
systemctl start nodle-gateway
# monit runner
cat <<EOF > /lib/systemd/system/chain-monit.service
[Unit]
Description=Monit Chain
Wants=network-online.target
Requires=network-online.target
After=network-online.target

[Service]

User=nodle
Group=nodle
ExecStart=/usr/local/bin/chain_monit_latest --port 8080
WorkingDirectory=/home/nodle
KillSignal=SIGINT
SyslogIdentifier=chain-monit

[Install]
WantedBy=multi-user.target
EOF
cd /usr/local/bin/
wget -O chain_monit_latest https://storage.googleapis.com/nodle-chain-artifacts/monit/latest
chmod +x /usr/local/bin/chain_monit_latest
systemctl daemon-reload
systemctl start chain-monit
systemctl enable chain-monit
