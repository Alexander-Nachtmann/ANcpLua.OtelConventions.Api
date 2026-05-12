# `@ancplua/otel-conventions-api`

TypeSpec library projecting OpenTelemetry semantic conventions into a reusable API surface. Distributed on npm under the `@ancplua` scope. **Not an official OpenTelemetry artifact** — the upstream OpenTelemetry semantic-conventions YAML model remains the authority; this is a TypeSpec projection and API experiment under the ANcpLua namespace.

Extracted from <https://github.com/O-ANcppLua/qyl> after PR #255.

## Install

```bash
npm install @ancplua/otel-conventions-api --save-dev
```

Then in your `main.tsp`:

```typespec
import "@ancplua/otel-conventions-api";
```

Sub-paths are exposed for consumers that want narrower imports:

```typespec
import "@ancplua/otel-conventions-api/otel";          // OTel signal models only
import "@ancplua/otel-conventions-api/models/genai";  // a single qyl model
import "@ancplua/otel-conventions-api/generated/otel-keys";  // generated semconv keys
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

Trusted Publishers via GitHub Actions OIDC. To publish:

1. **One-time setup on npmjs.com**: log into <https://www.npmjs.com/settings/ancplua/packages>, add a Trusted Publisher pointing at `O-ANcppLua/ANcpLua.OtelConventions.Api`, workflow `.github/workflows/publish.yml`, environment `npm-publish`.
2. Create a GitHub Release on this repo (or trigger the `Publish to npm` workflow manually). The workflow runs `npm publish --access public --provenance`; no NPM token needs to live in repo secrets.

## Versioning

See [`VERSIONING.md`](./VERSIONING.md). Stays in `0.x` until the OpenTelemetry community decides on the upstream PR shape; bump to `1.0.0` only after that lands.

## Naming

The package uses `@ancplua/otel-conventions-api` (kebab-case, npm convention) rather than an official-looking `opentelemetry.semanticconventions.api`. Under a personal or ANcpLua namespace, avoid names that imply ownership by the OpenTelemetry project.
