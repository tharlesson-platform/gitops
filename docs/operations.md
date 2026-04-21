# Operations

## Rotina operacional

1. Monitorar status de aplicações no Argo CD.
2. Tratar drift e falhas de sync com base no commit/PR.
3. Manter workflows saudáveis e sem bypass.
4. Revisar periodicamente políticas e CODEOWNERS.

## Checklist de incidentes

- Qual commit introduziu o problema?
- Qual PR aprovou a mudança?
- Quais ambientes foram afetados?
- O rollback por `git revert` é suficiente?
- Há necessidade de hotfix em `hotfix/*`?

## Troubleshooting básico

### Application `OutOfSync`

- Verificar diff no Argo CD.
- Confirmar se overlay correto foi alterado.
- Executar `kustomize build` localmente.

### Sync falha por recurso inválido

- Rodar `scripts/render-kustomize.sh`.
- Validar schemas com `kubeconform`.

### ApplicationSet não gera Applications

- Verificar labels dos clusters registrados no Argo.
- Conferir `goTemplate` e paths de overlays.

### Pipeline falha em produção

- Confirmar presença da label `prod-approved`.
- Confirmar revisão de CODEOWNERS.

## Boas práticas operacionais

- Evitar alterações grandes em um único PR.
- Promover com janelas controladas em produção.
- Priorizar mudanças declarativas e reversíveis.
- Garantir evidências de validação em PR.

## Métricas úteis

- Lead time de promoção dev->prod.
- Taxa de falhas por ambiente.
- MTTR com rollback via Git revert.
- Percentual de mudanças com aprovação em paths críticos.
