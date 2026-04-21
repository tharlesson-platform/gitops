# Clusters Directory

`clusters/` define os entrypoints de bootstrap por ambiente e região.

Cada pasta de cluster contém:

- `root-application.yaml`: Application raiz que aponta para `argocd/bootstrap`.
- `cluster-metadata.yaml`: metadados não sensíveis para contexto operacional.
- `kustomization.yaml`: composição local do cluster.

## Como usar

Aplique o `root-application.yaml` no cluster alvo para iniciar o fluxo GitOps.

Exemplo:

```bash
kubectl apply -f clusters/dev/us-east-1/root-application.yaml
```
