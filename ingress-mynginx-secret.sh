#!/usr/bin/env bash

# tls crt and key can create by 
# openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout tls.key -out tls.crt -subj "/CN=192.168.0.16.sslip.io"

cat << EOF | kubectl apply -f -
apiVersion: v1
kind: Secret
metadata:
  name: mynginx-ingress-tls
data:
  tls.crt: $(cat tls.crt | base64 | tr -d '\n')
  tls.key: $(cat tls.key | base64 | tr -d '\n')
type:
  kubernetes.io/tls
EOF
