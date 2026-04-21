# Naming Convention Policy

## Objetivo

Padronizar nomes para facilitar leitura, automação e busca.

## Regras

- Diretórios e arquivos em lowercase.
- Usar `kebab-case` preferencialmente.
- Sem espaços em nomes de paths.
- Ambientes permitidos: `dev`, `stage`, `prod`.
- Regiões no padrão cloud (`us-east-1`, `us-west-2`).

## Padrões recomendados

- Aplicações: `sample-api`, `payments-worker`.
- Namespaces: `apps-dev`, `apps-stage`, `apps-prod`.
- Branches: `feature/*`, `bugfix/*`, `hotfix/*`, `release/*`.

## Validação

Automatizada via `scripts/check-naming.sh` e workflow `validate-manifests.yml`.
