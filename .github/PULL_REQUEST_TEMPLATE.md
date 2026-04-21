## Summary

<!-- Describe what changed and why -->

## Change Type

- [ ] New application
- [ ] Application update
- [ ] Environment promotion (dev -> stage -> prod)
- [ ] Argo CD / ApplicationSet change
- [ ] Governance/policy update
- [ ] Documentation update

## Promotion Checklist

- [ ] Change was validated in `dev`
- [ ] Evidence attached (logs, screenshots, Argo CD sync status)
- [ ] Kustomize overlay for target environment is correct
- [ ] No direct cluster mutation outside GitOps flow
- [ ] Rollback plan documented (commit revert path)

## Risk Validation

- [ ] Affects critical path (`argocd/`, `clusters/prod/`, `policies/`)
- [ ] Production impact assessed
- [ ] Required human approvals requested
- [ ] Backward compatibility checked
- [ ] No real secrets committed

## Operational Notes

- [ ] Requires manual post-merge step
- [ ] Requires coordination with platform/SRE
- [ ] Requires maintenance window

## Testing and Validation

- [ ] `scripts/validate.sh` executed locally
- [ ] GitHub Actions checks passed
- [ ] Manifests render successfully (`kustomize build`)

## Related

- Issue:
- Incident/Change request:
