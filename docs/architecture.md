# Architecture

## Objetivo arquitetural

Garantir que o estado desejado de Kubernetes seja declarado no GitHub e reconciliado pelo Argo CD, com separação clara entre aplicações, ambientes, clusters e governança.

## Componentes centrais

- GitHub: source of truth do desired state.
- Argo CD: engine de reconciliação e auditoria operacional.
- ApplicationSet: geração escalável de Applications por ambiente/cluster.
- Kustomize: composição de `base` e `overlays` sem duplicação excessiva.
- GitHub Actions: validação e qualidade antes do merge.

## Princípios

1. Pull Request first.
2. CI valida, Argo CD aplica.
3. Promotion by merge em branches protegidas.
4. Auditabilidade por histórico de commits, PRs e sync status.
5. Segregação de responsabilidades por AppProjects e CODEOWNERS.

## Domínios de estrutura

- `apps/`: manifests de workload e overlays por ambiente.
- `argocd/`: projetos, applications e applicationsets.
- `clusters/`: entrypoints por cluster para bootstrap e contexto.
- `policies/`: regras operacionais e de governança.
- `docs/`: arquitetura, fluxos e operação.

## Modelo single-cluster e multi-cluster

- Single-cluster: ApplicationSet por ambiente (`apps-by-env.yaml`) apontando para o cluster local.
- Multi-cluster: ApplicationSet por clusters (`apps-by-cluster.yaml`) usando labels em clusters registrados no Argo CD.

## Segregação por times

Use AppProjects para limitar:

- fontes permitidas (`sourceRepos`),
- namespaces/destinos permitidos (`destinations`),
- escopo de recursos (`clusterResourceWhitelist`).

Consulte os exemplos em `argocd/projects/`.
