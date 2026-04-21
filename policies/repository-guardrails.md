# Repository Guardrails

## Guardrails técnicos

- CI valida qualidade e conformidade, sem aplicar manifests no cluster.
- Argo CD é responsável por reconciliação.
- Mudanças em paths críticos exigem revisão reforçada.

## Paths críticos

- `.github/workflows/`
- `argocd/`
- `clusters/prod/`
- `policies/`

## Guardrails de processo

1. Branch protection habilitada para `main`.
2. CODEOWNERS obrigatório em paths críticos.
3. Status checks obrigatórios antes de merge.
4. Conversas de revisão devem ser resolvidas.

## Guardrails de produção

- Aprovação manual mandatória.
- Label `prod-approved` para mudanças em `clusters/prod/`.
- Janela de mudança recomendada para alterações de alto risco.

## Auditabilidade

A trilha de auditoria deve incluir:

- autor da mudança,
- revisão e aprovadores,
- resultado dos checks,
- commit final promovido.
