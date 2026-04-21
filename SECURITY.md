# Security Policy

## Reporting a vulnerability

Se você identificar uma vulnerabilidade, não abra issue pública com detalhes exploráveis.

Canal recomendado:

- Abra um contato privado com o mantenedor do repositório.
- Inclua evidências mínimas, impacto potencial e proposta de mitigação.

## Security principles in this repository

- GitHub é a fonte de verdade para estado desejado (desired state).
- Argo CD reconcilia o estado no cluster; CI não aplica manifests.
- Secrets reais não são versionados.
- Produção exige revisão humana e branch protection.
- Mudanças críticas têm trilha de auditoria via Pull Request.

## Secret management guidance

Este repositório usa placeholders e recomenda:

- External Secrets Operator
- Sealed Secrets
- SOPS + KMS/Vault

Consulte também `policies/secret-management.md`.
