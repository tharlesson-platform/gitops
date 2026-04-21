# Bootstrap Guide

Este guia prepara um cluster para operar com este repositório como catálogo GitOps.

## Pré-requisitos

- Kubernetes cluster acessível por `kubectl`.
- Argo CD instalado (namespace `argocd`).
- Repositório clonado e com acesso ao GitHub.
- `kustomize`, `kubectl`, `argocd` CLI.

## 1) Atualizar placeholders de repositório

Substitua `https://github.com/your-org/your-gitops-repo.git` em:

- `argocd/applications/*.yaml`
- `argocd/applicationsets/*.yaml`
- `clusters/**/root-application.yaml`

## 2) Aplicar aplicação root do cluster

Exemplo para `dev/us-east-1`:

```bash
kubectl apply -f clusters/dev/us-east-1/root-application.yaml
```

A partir desse ponto, o Argo CD passa a reconciliar `argocd/bootstrap`.

## 3) Registrar clusters adicionais (multi-cluster)

Registrar cluster remoto no Argo CD:

```bash
argocd cluster add <context-name>
```

Label obrigatório para `apps-by-cluster.yaml`:

```bash
kubectl -n argocd label secret <cluster-secret-name> gitops.argocd.io/managed=true environment=dev
```

Valores suportados para `environment`: `dev`, `stage`, `prod`.

## 4) Validar sync

```bash
argocd app list
argocd app get root-dev-us-east-1
```

## 5) Validar health do fluxo

- GitHub Actions verdes no PR.
- `Synced/Healthy` no Argo CD.
- Recursos esperados no namespace de destino.

## Bootstrap seguro em produção

- Exigir aprovação humana para PRs com `clusters/prod/`.
- Habilitar branch protection/rulesets na `main`.
- Exigir review de CODEOWNERS e checks obrigatórios.
