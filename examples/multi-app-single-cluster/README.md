# Multi App / Single Cluster

## Objetivo

Gerenciar múltiplas apps no mesmo cluster com padrão base/overlays.

## Arquivos usados

- `apps/sample-api/`
- `apps/sample-worker/`
- `argocd/applicationsets/apps-by-env.yaml`

## Passos

1. Atualizar `repoURL` no ApplicationSet.
2. Aplicar ApplicationSet:

```bash
kubectl apply -f argocd/applicationsets/apps-by-env.yaml
```

3. Conferir aplicações geradas:

```bash
argocd app list
```

## Resultado esperado

Applications por app/ambiente (`sample-api-dev`, `sample-worker-stage`, etc.).
