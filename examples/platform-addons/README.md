# Platform Addons

## Objetivo

Demonstrar o repositório como catálogo GitOps de plataforma.

## Addon implementado

- `apps/platform-metrics-server/` (Kustomize + release pinada)

## Application de exemplo

- `argocd/applications/platform-metrics-server.yaml`

## Extensões sugeridas

Use o mesmo padrão para adicionar:

- `ingress-nginx`
- `external-dns`

## Boas práticas

- Pinar versões de releases.
- Tratar addons como aplicações de plataforma no `AppProject` `platform`.
- Promover mudanças em addon com PR dedicado e revisão reforçada.
