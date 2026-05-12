# `@o-ancpplua/otel-conventions-api`

TypeSpec library projecting OpenTelemetry semantic conventions into a reusable API surface. Distributed on **GitHub Packages** under the `@o-ancpplua` scope (matches the `O-ANcppLua` GitHub org). **Not an official OpenTelemetry artifact** — the upstream OpenTelemetry semantic-conventions YAML model remains the authority; this is a TypeSpec projection and API experiment under the ANcpLua namespace.

Extracted from <https://github.com/O-ANcppLua/qyl> after PR #255.

## Install

Add `.npmrc` to your project root pointing the `@o-ancpplua` scope at GitHub Packages:

```ini
@o-ancpplua:registry=https://npm.pkg.github.com
```

Then install normally:

```bash
npm install @o-ancpplua/otel-conventions-api --save-dev
```

In CI, set `NODE_AUTH_TOKEN=${{ secrets.GITHUB_TOKEN }}` and add `always-auth=true` to your `.npmrc`. For local dev, run `npm login --scope=@o-ancpplua --registry=https://npm.pkg.github.com` once with a GitHub PAT that has `read:packages`.

In your `main.tsp`:

```typespec
import "@o-ancpplua/otel-conventions-api";
```

Sub-paths are exposed for consumers that want narrower imports:

```typespec
import "@o-ancpplua/otel-conventions-api/otel";          // OTel signal models only
import "@o-ancpplua/otel-conventions-api/models/genai";  // a single qyl model
import "@o-ancpplua/otel-conventions-api/generated/otel-keys";  // generated semconv keys
```

## Contents

- `main.tsp` — TypeSpec entry point.
- `otel/` — OpenTelemetry-shaped core models; consumers should import via `otel/otel-conventions.tsp`.
- `generated/otel-keys.gen.tsp` — generated semantic-convention key constants from upstream pinned at v1.41.0.
- `models/`, `api/`, `common/`, `intelligence/` — API models and routes.
- `emitters/` — local TypeSpec emitters required by `tspconfig.yaml` (csharp, duckdb, ts-types, otelconventions-lint).

## Local development

```bash
npm install
npm run lint       # tsp compile --no-emit --warn-as-error
npm run compile    # full emit; outputs under generated/
npm run format     # tsp format **/*.tsp
```

## Publishing

Uses **GitHub Packages** (no separate npmjs.com account needed — auth flows through the `GITHUB_TOKEN` minted automatically inside GitHub Actions).

1. On this repo: Settings → Environments → create an environment named `github-packages` (no protection rules required unless you want manual approval before each publish).
2. Cut a GitHub Release. The `.github/workflows/publish.yml` workflow runs on `release: published`, calls `npm publish --access public --provenance`, and emits an npm provenance attestation tied to the workflow run.

Workflow can also be triggered manually via `workflow_dispatch` with a custom `tag` input (e.g. `next`, `rc`, `beta`).

## Versioning

See [`VERSIONING.md`](./VERSIONING.md). Stays in `0.x` until the OpenTelemetry community decides on the upstream PR shape; bump to `1.0.0` only after that lands.

## Naming

The npm scope is `@o-ancpplua` (lowercase, matches the GitHub org name as GitHub Packages requires). If this ever migrates to npmjs.com, the scope can be flattened to `@ancplua` at that time.
