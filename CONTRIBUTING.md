# Contributing Guide

Obrigado por contribuir com este repositório GitOps.

## Fluxo de contribuição

1. Crie uma branch a partir da `main` usando um dos padrões:
   - `feature/<short-description>`
   - `bugfix/<short-description>`
   - `hotfix/<short-description>`
   - `release/<version-or-theme>`
2. Faça mudanças pequenas e focadas.
3. Execute localmente `scripts/validate.sh`.
4. Abra um Pull Request com o template preenchido.
5. Aguarde validações automáticas e revisão dos CODEOWNERS.

## Regras importantes

- Não comitar secrets reais.
- Não executar `kubectl apply` na pipeline de CI.
- Produção só via PR aprovado e merge em branch protegida.
- Toda mudança em `clusters/prod/` exige aprovação humana explícita.

## Padrão de commits (sugestão)

- `feat: ...`
- `fix: ...`
- `docs: ...`
- `chore: ...`

## Dúvidas

Abra uma issue usando o template adequado em `.github/ISSUE_TEMPLATE/`.
