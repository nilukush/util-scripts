#/bin/sh

wget -q -O - http://www.charlesproxy.com/packages/apt/PublicKey | sudo apt-key add -
sudo cat > /etc/apt/sources.list.d/charles.list <<EOF
deb http://www.charlesproxy.com/packages/apt/ charles-proxy main
EOF

sudo apt-get update
sudo apt-get install charles-proxy

