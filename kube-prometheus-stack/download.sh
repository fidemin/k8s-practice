
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
helm fetch --untar prometheus-community/kube-prometheus-stack