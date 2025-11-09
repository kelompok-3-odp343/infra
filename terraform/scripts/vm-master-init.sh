#!/bin/bash
set -e

# Update dan install dependency dasar
sudo apt-get update -y
sudo apt-get install -y curl

# Jalankan instalasi K3s sebagai master node
curl -sfL https://get.k3s.io | sh -s - server \
  --cluster-init \
  --node-name=wandoor-master \
  --node-external-ip=10.148.15.215 \
  --flannel-backend=vxlan

# Pastikan service aktif
sudo systemctl enable k3s
sudo systemctl start k3s

# Tampilkan token agar bisa digunakan untuk worker
echo "=================================================="
echo "✅ K3s Master setup complete!"
echo "📍 Token Worker:"
sudo cat /var/lib/rancher/k3s/server/node-token
echo "=================================================="
