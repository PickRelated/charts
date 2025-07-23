Usage (Linux only)

Generate Token
--------------
```bash
kubectl create token default --duration 87600h > k8Token.txt
```

Deployer
```bash
helm repo add pickrelated https://pickrelated.github.io/charts
helm install deployer pickrelated/deployer \
  --set global.server=de \
  --set global.dockerConfigBase64=$(cat ./config.json | base64 -w 0) \
  --set global.env.K8_TOKEN=$(cat ./k8Token.txt)
```

App sample
```bash
helm repo add pickrelated https://pickrelated.github.io/charts
helm install app pickrelated/app-sample \
  --set global.server=de \
  --set global.dockerConfigBase64=$(cat ./config.json | base64 -w 0) \
  --set global.tlsKeyBase64=$(cat ./tls.key | base64 -w 0) \
  --set global.tlsCertBase64=$(cat ./tls.cert | base64 -w 0)
```

VPN
```bash
helm repo add pickrelated https://pickrelated.github.io/charts
helm install vpn pickrelated/vpn \
  --set ip=1.2.3.4
  --set psk=yourpsk \
  --set user=vpnuser \
  --set pass=yourpass
```

Metallb
```bash
helm repo add pickrelated https://pickrelated.github.io/charts
helm install metallb pickrelated/metallb --set global.server=de
```

Development debug
```bash
helm template . \
  --set global.server=de \
  --set-string global.dockerConfigBase64=$(cat ./config.json | base64) \
  --set-string global.tlsKeyBase64=$(cat ./tls.key | base64) \
  --set-string global.tlsCertBase64=$(cat ./tls.cert | base64)
```
