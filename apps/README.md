# Apps Directory

`apps/` contém o catálogo de workloads e addons gerenciados por GitOps.

## Convenção

- Cada aplicação tem `base/` e `overlays/`.
- Overlays permitidos: `dev`, `stage`, `prod`.
- Customizações de ambiente devem ficar no overlay, não na base.

## Aplicações incluídas

- `sample-api`: API HTTP com Service e Ingress.
- `sample-worker`: worker assíncrono sem exposição externa.
- `platform-metrics-server`: addon de plataforma com manifest oficial.
