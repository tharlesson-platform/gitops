# Governance

Este repositório adota governança orientada a plataforma/SRE para garantir previsibilidade e auditabilidade.

## Papéis

- Platform Team: mantém Argo CD, ApplicationSets, policies e bootstrap.
- App Teams: mantêm manifests das aplicações sob padrões definidos.
- Reviewers/Approvers: validam risco, segurança e promoção entre ambientes.

## Modelo de decisão

1. Mudanças propostas via Pull Request.
2. Validações automáticas no GitHub Actions.
3. Aprovação de CODEOWNERS em paths críticos.
4. Merge em branch protegida.
5. Reconciliação automática pelo Argo CD.

## Fontes de verdade

- GitHub repo: desired state.
- Argo CD: estado observado e reconciliação.
- Cluster: estado real, continuamente alinhado ao Git.

## Referências

- `policies/repository-guardrails.md`
- `policies/promotion-policy.md`
- `docs/operations.md`
