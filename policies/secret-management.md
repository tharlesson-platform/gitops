# Secret Management Policy

## Regra principal

Secrets reais não devem ser commitados neste repositório.

## O que pode existir aqui

- Placeholders não sensíveis.
- Exemplos de estrutura para integração com ferramenta de segredo.

## Ferramentas recomendadas

- External Secrets Operator + provider cloud/vault.
- Sealed Secrets (Bitnami).
- SOPS com KMS/Vault.

## Padrão de placeholder

Exemplo:

```yaml
apiVersion: v1
kind: Secret
metadata:
  name: app-secret-placeholder
type: Opaque
stringData:
  API_TOKEN: "REPLACE_WITH_EXTERNAL_SECRET"
```

## Boas práticas

- Rotação periódica de credenciais fora do Git.
- Princípio do menor privilégio.
- Auditoria de acesso ao provider de secrets.
- Scans automáticos (gitleaks) em PRs.
