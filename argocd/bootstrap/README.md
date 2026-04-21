# Bootstrap Kustomization

Este diretório representa o "root payload" do App of Apps.

Inclui:

- AppProjects
- ApplicationSets por ambiente e por cluster
- Application de addon de plataforma

`sample-app.yaml` e `sample-worker.yaml` em `argocd/applications/` ficam como exemplos de Application estática e não entram no bootstrap padrão para evitar gestão duplicada.
