# ANcpLua.OtelConventions.Api

Private extracted TypeSpec source for ANcpLua OpenTelemetry convention API experiments.

This repository was extracted from `Alexander-Nachtmann/qyl` after PR #255:

https://github.com/Alexander-Nachtmann/qyl/pull/255

The source is not an official OpenTelemetry repository and must not be treated as normative OpenTelemetry semantic-conventions source. The upstream OpenTelemetry semantic-conventions YAML model remains the authority; this repository is a TypeSpec projection and API experiment under the ANcpLua namespace.

## Contents

- `main.tsp` is the TypeSpec entry point.
- `otel/` contains OpenTelemetry-shaped core models.
- `generated/otel-keys.gen.tsp` contains generated semantic-convention key constants from upstream semantic conventions pinned at v1.41.0.
- `models/`, `api/`, `common/`, `telemetry/`, and `intelligence/` contain extracted qyl-origin API models and routes.
- `emitters/` contains local TypeSpec emitters required by `tspconfig.yaml`.

## Commands

```bash
npm install
npm run lint
npm run compile
```

Generated outputs are written under `generated/` inside this repository.

## Naming

The repository intentionally uses `ANcpLua.OtelConventions.Api` rather than an official-looking `opentelemetry.semanticconventions.api` name. Under a personal or ANcpLua namespace, avoid names that imply ownership by the OpenTelemetry project.
