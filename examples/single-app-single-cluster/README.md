# Single App / Single Cluster

## Objetivo

Subir uma única aplicação (`sample-api`) em um único cluster usando Argo CD Application estática.

## Arquivos usados

- `argocd/applications/sample-app.yaml`
- `apps/sample-api/overlays/dev`

## Passos

1. Atualizar `repoURL` no arquivo da Application.
2. Aplicar a Application no cluster:

```bash
kubectl apply -f argocd/applications/sample-app.yaml
```

3. Verificar sincronização:

```bash
argocd app get sample-app
```

## Resultado esperado

- Recursos criados em `apps-dev`.
- Estado `Synced` e `Healthy` no Argo CD.
