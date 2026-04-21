# Como Criar Uma Nova Aplicacao

O repositorio agora inclui um scaffold oficial para reduzir variacao estrutural entre apps.

## Uso rapido

```bash
./scripts/create-app.sh --name payments-api --image ghcr.io/example-org/payments-api:0.1.0 --port 8080
```

## O que o scaffold gera

- `apps/<app>/README.md`
- `apps/<app>/base/{deployment,service,kustomization}.yaml`
- `apps/<app>/overlays/{dev,stage,prod}/{kustomization,replicas,ingress}.yaml`

## O que revisar depois da geracao

1. imagem e probes em `base/deployment.yaml`;
2. namespace por ambiente;
3. dominios dos ingressos;
4. registro da app no fluxo Argo CD/ApplicationSet.

## Quando usar este scaffold

- para novas apps de referencia;
- para demos locais e labs;
- para onboarding rapido de workloads no catalogo GitOps.

## Quando nao usar

- quando a app exigir Helm em vez de Kustomize;
- quando um pattern de plataforma mais opinativo ja existir em `argocd`.
