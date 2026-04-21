# Scripts

Scripts utilitários para validação local e suporte operacional.

## Scripts disponíveis

- `validate.sh`: orquestra todas as validações.
- `check-yaml.sh`: lint de YAML com `yamllint`.
- `render-kustomize.sh`: renderiza todos os overlays/kustomizations.
- `validate-argocd.sh`: valida manifests do Argo CD com `kubeconform`.
- `check-structure.sh`: valida estrutura de diretórios.
- `check-required-files.sh`: valida presença de arquivos mandatórios.
- `check-naming.sh`: valida convenção de nomes.
- `check-critical-paths.sh`: destaca mudanças em paths críticos.
- `tree.sh`: exibe árvore do repositório.

## Exemplo

```bash
./scripts/validate.sh
```
