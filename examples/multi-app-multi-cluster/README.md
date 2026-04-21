# Multi App / Multi Cluster

## Objetivo

Escalar deploy para vários clusters com ApplicationSet usando labels de cluster.

## Arquivo usado

- `argocd/applicationsets/apps-by-cluster.yaml`

## Pré-requisitos

- Clusters registrados no Argo CD (`argocd cluster add ...`).
- Label `gitops.argocd.io/managed=true` no secret de cada cluster.
- Label `environment` com `dev`, `stage` ou `prod`.

## Passos

1. Atualizar `repoURL`.
2. Aplicar ApplicationSet.
3. Conferir aplicações criadas por cluster.

## Resultado esperado

- Uma Application por app por cluster.
- Namespace de destino seguindo `apps-<environment>`.
- Auto-sync para todos os ambientes, com controle de produção no fluxo de PR/aprovação.
