# Promotion Policy

## Objetivo

Controlar promoção de configurações entre ambientes com segurança operacional.

## Regras de promoção

1. Promoção apenas por Pull Request.
2. `dev` deve ser validado antes de `stage`.
3. `stage` deve ser validado antes de `prod`.
4. `prod` exige aprovação manual (CODEOWNERS + revisão de risco).
5. Todos os checks automáticos devem passar.

## Produção

- Paths `clusters/prod/` e overlays `prod` são sensíveis.
- Label `prod-approved` obrigatória quando houver alteração em `clusters/prod/`.
- Recomendado exigir no mínimo 2 aprovações humanas.

## Evidências mínimas

- Resultado de pipeline.
- Plano de rollback.
- Validação funcional em ambiente anterior.

## Exceções

- Incidentes críticos podem usar `hotfix/*`, mantendo PR e auditoria.
