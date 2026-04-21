# Promotion Flow

## Modelo de promoção

A promoção é feita por Pull Request e merge, nunca por `kubectl apply` manual em pipeline.

## Fluxo recomendado

1. Implementar mudança em `apps/<app>/overlays/dev`.
2. Validar em `dev` (CI + Argo CD).
3. Promover para `stage` via PR alterando overlay correspondente.
4. Validar em `stage`.
5. Promover para `prod` via PR dedicado com aprovação humana.

## Estrutura de PRs

- PR 1: `feature/*` -> `main` (dev).
- PR 2: promoção `dev -> stage`.
- PR 3: promoção `stage -> prod` com revisão reforçada.

## Regras para produção

- Aprovação obrigatória de CODEOWNERS.
- Label `prod-approved` quando houver mudança em `clusters/prod/`.
- Todos os workflows obrigatórios aprovados.

## Rollback

Rollback padrão via reversão do commit em `main`:

```bash
git revert <commit-sha>
git push origin main
```

Argo CD detecta e reconcilia para o estado anterior.

## Evidências mínimas por promoção

- Link do PR.
- Resultado dos checks.
- Estado `Synced/Healthy` do Argo CD.
- Impacto e plano de rollback no template de PR.
