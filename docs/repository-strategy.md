# Repository Strategy

## Estratégia

Este repositório usa uma abordagem monorepo de plataforma GitOps com separação lógica por domínio.

## Vantagens

- Visão consolidada de estado desejado.
- Reutilização de padrões base/overlay.
- Auditoria unificada de mudanças.
- Governança centralizada via CODEOWNERS e policies.

## Branch model

- `main`: branch protegida, usada para estado ativo.
- `feature/*`: novas capacidades.
- `bugfix/*`: correções sem mudança funcional ampla.
- `hotfix/*`: correções urgentes, inclusive produção.
- `release/*`: consolidação para marcos/versionamentos.

## Branch protection e rulesets (GitHub)

Configuração recomendada para `main`:

1. Require pull request before merging.
2. Require approvals (>=2 para mudanças críticas).
3. Require review from Code Owners.
4. Require status checks to pass.
5. Restrict force pushes e direct pushes.
6. Require conversation resolution.

Rulesets adicionais:

- Regra específica para `clusters/prod/**` exigindo aprovações extras.
- Regra para `.github/workflows/**` restringindo alterações a mantenedores.

## Estratégia de escala

Para cenários maiores, separar por domínios internos:

- `apps/` para workloads de produto.
- `apps/platform-*` para addons de plataforma.
- `argocd/projects/` para boundaries multi-time.

## Non-goals deste repositório

- Não aplicar manifests diretamente via CI/CD.
- Não armazenar segredos reais em texto puro.
