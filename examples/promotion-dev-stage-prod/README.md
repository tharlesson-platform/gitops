# Promotion dev -> stage -> prod

## Objetivo

Demonstrar promoção controlada por Pull Request usando overlays.

## Sequência sugerida

1. Alterar `apps/sample-api/overlays/dev/*`.
2. Abrir PR de validação em dev.
3. Após validação, replicar mudança em `overlays/stage` e abrir PR.
4. Repetir para `overlays/prod` com aprovação humana reforçada.

## Regras

- CI deve estar verde em todos os PRs.
- Produção requer revisão de CODEOWNERS.
- Quando houver mudança em `clusters/prod/`, incluir label `prod-approved`.

## Rollback

```bash
git revert <merge-commit-sha>
git push origin main
```
