#!/usr/bin/env bash

set -euo pipefail

usage() {
  cat <<'EOF'
Usage: ./scripts/create-app.sh --name <app-name> [--image <container-image>] [--port <service-port>] [--namespace-prefix <prefix>]

Example:
  ./scripts/create-app.sh --name payments-api --image ghcr.io/example-org/payments-api:0.1.0 --port 8080
EOF
}

app_name=""
image="ghcr.io/example-org/sample-app:0.1.0"
port="8080"
namespace_prefix="apps"

while [[ $# -gt 0 ]]; do
  case "$1" in
    --name)
      app_name="${2:-}"
      shift 2
      ;;
    --image)
      image="${2:-}"
      shift 2
      ;;
    --port)
      port="${2:-}"
      shift 2
      ;;
    --namespace-prefix)
      namespace_prefix="${2:-}"
      shift 2
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown argument: $1" >&2
      usage >&2
      exit 1
      ;;
  esac
done

if [[ -z "${app_name}" ]]; then
  echo "--name is required" >&2
  usage >&2
  exit 1
fi

if [[ ! "${app_name}" =~ ^[a-z0-9-]+$ ]]; then
  echo "App name must contain only lowercase letters, numbers, and hyphens." >&2
  exit 1
fi

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
app_root="${repo_root}/apps/${app_name}"

if [[ -e "${app_root}" ]]; then
  echo "App already exists: ${app_root}" >&2
  exit 1
fi

mkdir -p \
  "${app_root}/base" \
  "${app_root}/overlays/dev" \
  "${app_root}/overlays/stage" \
  "${app_root}/overlays/prod"

cat > "${app_root}/README.md" <<EOF
# ${app_name}

Aplicacao GitOps gerada a partir do scaffold oficial do repositório.

## Estrutura

- \`base/\`: manifests compartilhados entre ambientes.
- \`overlays/dev\`: customizacoes de desenvolvimento.
- \`overlays/stage\`: customizacoes de homologacao.
- \`overlays/prod\`: customizacoes de producao.

## Proximos passos

1. Ajustar a imagem em \`base/deployment.yaml\`.
2. Revisar dominios e namespace dos overlays.
3. Registrar a aplicacao no ApplicationSet ou criar \`Application\` dedicada.
EOF

cat > "${app_root}/base/kustomization.yaml" <<EOF
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization

resources:
  - deployment.yaml
  - service.yaml

commonLabels:
  app.kubernetes.io/name: ${app_name}
EOF

cat > "${app_root}/base/deployment.yaml" <<EOF
apiVersion: apps/v1
kind: Deployment
metadata:
  name: ${app_name}
spec:
  replicas: 2
  selector:
    matchLabels:
      app: ${app_name}
  template:
    metadata:
      labels:
        app: ${app_name}
    spec:
      containers:
        - name: ${app_name}
          image: ${image}
          ports:
            - containerPort: ${port}
          readinessProbe:
            httpGet:
              path: /healthz
              port: ${port}
            initialDelaySeconds: 5
            periodSeconds: 10
          livenessProbe:
            httpGet:
              path: /healthz
              port: ${port}
            initialDelaySeconds: 15
            periodSeconds: 20
EOF

cat > "${app_root}/base/service.yaml" <<EOF
apiVersion: v1
kind: Service
metadata:
  name: ${app_name}
spec:
  selector:
    app: ${app_name}
  ports:
    - name: http
      port: 80
      targetPort: ${port}
EOF

for environment in dev stage prod; do
  namespace="${namespace_prefix}-${environment}"
  replicas="2"
  hostname="${app_name}.${environment}.platform.example.com"

  if [[ "${environment}" == "dev" ]]; then
    replicas="1"
  elif [[ "${environment}" == "prod" ]]; then
    replicas="3"
  fi

  cat > "${app_root}/overlays/${environment}/kustomization.yaml" <<EOF
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization

namespace: ${namespace}

resources:
  - ../../base
  - ingress.yaml

patches:
  - path: replicas.yaml
EOF

  cat > "${app_root}/overlays/${environment}/replicas.yaml" <<EOF
apiVersion: apps/v1
kind: Deployment
metadata:
  name: ${app_name}
spec:
  replicas: ${replicas}
EOF

  cat > "${app_root}/overlays/${environment}/ingress.yaml" <<EOF
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: ${app_name}
spec:
  rules:
    - host: ${hostname}
      http:
        paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: ${app_name}
                port:
                  number: 80
EOF
done

echo "Scaffold created at ${app_root}"
