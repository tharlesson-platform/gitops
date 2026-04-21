# Branch Strategy Policy

## Branches suportadas

- `main`: estado desejado ativo, protegido.
- `feature/*`: desenvolvimento de novas capacidades.
- `bugfix/*`: correções de defeitos.
- `hotfix/*`: correções urgentes com potencial impacto em produção.
- `release/*`: consolidação de rollout ou temas de entrega.

## Regras

1. Merge em `main` apenas por Pull Request.
2. Rebase/squash conforme padrão do time.
3. Commits diretos em `main` proibidos.
4. `hotfix/*` deve incluir post-mortem e PR de correção definitiva.

## Estratégia de promoção

- Mudanças evoluem em sequência `dev -> stage -> prod`.
- Produção requer aprovação humana explícita.
