# Argo CD Directory

Conteúdo declarativo do Argo CD para operar o fluxo GitOps.

## Estrutura

- `projects/`: AppProjects para boundaries e segregação.
- `applications/`: Applications estáticas (casos pontuais/single-cluster).
- `applicationsets/`: geração dinâmica de Applications para escala.
- `bootstrap/`: kustomization raiz consumida pela root Application.

## Observação importante

Atualize `repoURL` com o endereço real do seu repositório antes do bootstrap.
