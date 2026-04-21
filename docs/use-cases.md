# Use Cases

Este documento lista casos práticos que podem ser executados com os artefatos deste repositório.

## 1) Single app em ambiente dev

- Manifesto: `apps/sample-api/overlays/dev`
- Entrega: `argocd/applications/sample-app.yaml`
- Resultado: aplicação sincronizada no namespace `apps-dev`.

## 2) Mesma app promovida para stage e prod

- Alterar overlays `stage` e `prod` via PRs sequenciais.
- Validar Argo CD `Synced/Healthy` em cada etapa.

## 3) Duas aplicações com padrão base/overlays

- `apps/sample-api/`
- `apps/sample-worker/`
- Ambas reutilizam base e personalizam por ambiente.

## 4) Multi-cluster usando ApplicationSet

- Arquivo: `argocd/applicationsets/apps-by-cluster.yaml`
- Pré-requisito: clusters registrados no Argo com labels.

## 5) Repositório como catálogo GitOps da plataforma

- Workloads de negócio + addons no mesmo padrão.
- Governança central em `policies/` e `argocd/projects/`.

## 6) Adição de addon de plataforma

- Exemplo: `apps/platform-metrics-server/`.
- Deploy controlado por Application Argo CD dedicado.

## 7) Rollback por reversão de commit

- Reverter commit no GitHub.
- Argo CD reconcilia automaticamente para o estado anterior.

## 8) Auditoria por histórico de Pull Requests

- Toda mudança tem trilha: branch, PR, reviewer, checks e merge.

## 9) Segregação por times via AppProjects

- `apps-project.yaml` e `team-retail-project.yaml` restringem escopo por time.

## 10) Promoção controlada com aprovação manual em produção

- Uso de CODEOWNERS + label `prod-approved` + branch protection.
