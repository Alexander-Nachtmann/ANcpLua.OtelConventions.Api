// =============================================================================
// ANcpLua Emit Config — central augment-decorator file for the three ANcpLua
// TypeSpec emitters (@ancplua/typespec-emit-csharp, emit-duckdb, emit-ts-types).
//
// This file decorates the existing hand-authored TypeSpec models so the new
// emitters know:
//   - which C# namespace each model maps to (matches NamespaceRoutingTable.cs
//     exactly, mirroring the current contract-drift outputs)
//   - which models are DuckDB tables and what their SQL names are
//   - which scalars are opaque branded string IDs on the TypeScript side
//
// Commit 5 of the TypeSpec-native-emitters mandate. Decoration-only: the old
// @extension("x-duckdb-table", ...) / @extension("x-csharp-type", ...) calls
// remain in place until Commit 10 deletes the old SchemaGenerator.cs path.
// Both paths emit identical shapes until Commit 6 cuts tspconfig over.
// =============================================================================

import "@ancplua/typespec-emit-csharp";
import "@ancplua/typespec-emit-duckdb";
import "@ancplua/typespec-emit-ts-types";

import "./main.tsp";
import "./models/agent/agent-run.tsp";
import "./models/agent/tool-call.tsp";
import "./models/agent/workflow-checkpoint.tsp";
import "./models/agent/workflow-execution.tsp";
import "./models/alerting.tsp";
import "./models/configurator.tsp";
import "./models/issues.tsp";
import "./models/retention.tsp";
import "./models/search.tsp";
import "./models/triage.tsp";
import "./models/workflow.tsp";
import "./models/workspace.tsp";
import "./intelligence/main.tsp";

using ANcpLua.OtelConventions.Emit.CSharp;
using ANcpLua.OtelConventions.Emit.DuckDb;
using ANcpLua.OtelConventions.Emit.TsTypes;

// -----------------------------------------------------------------------------
// C# namespace routing — one @@csharpNamespace per namespace declared in any
// hand-authored .tsp file. Values mirror NamespaceRoutingTable.cs exactly.
// -----------------------------------------------------------------------------

@@csharpNamespace(ANcpLua.OtelConventions.Api, "ANcpLua.OtelConventions.Api");
@@csharpNamespace(ANcpLua.OtelConventions.Api.Streaming, "ANcpLua.OtelConventions.Api.Streaming");

@@csharpNamespace(ANcpLua.OtelConventions.Common, "ANcpLua.OtelConventions.Common");
@@csharpNamespace(ANcpLua.OtelConventions.Common.Errors, "ANcpLua.OtelConventions.Common.Errors");
@@csharpNamespace(ANcpLua.OtelConventions.Common.Pagination, "ANcpLua.OtelConventions.Common.Pagination");

@@csharpNamespace(ANcpLua.OtelConventions.Intelligence, "ANcpLua.OtelConventions.Intelligence");

@@csharpNamespace(ANcpLua.OtelConventions.Domains, "ANcpLua.OtelConventions.Domains");
@@csharpNamespace(ANcpLua.OtelConventions.Domains.AI.GenAi, "ANcpLua.OtelConventions.Domains.AI.GenAi");
@@csharpNamespace(ANcpLua.OtelConventions.Domains.Agent.Run, "ANcpLua.OtelConventions.Domains.Agent.Run");
@@csharpNamespace(ANcpLua.OtelConventions.Domains.Agent.ToolCall, "ANcpLua.OtelConventions.Domains.Agent.ToolCall");
@@csharpNamespace(ANcpLua.OtelConventions.Domains.Agent.Checkpoint, "ANcpLua.OtelConventions.Domains.Agent.Checkpoint");
@@csharpNamespace(ANcpLua.OtelConventions.Domains.Agent.Workflow, "ANcpLua.OtelConventions.Domains.Agent.Workflow");
@@csharpNamespace(ANcpLua.OtelConventions.Domains.Alerting, "ANcpLua.OtelConventions.Domains.Alerting");
@@csharpNamespace(ANcpLua.OtelConventions.Domains.Configurator, "ANcpLua.OtelConventions.Domains.Configurator");
@@csharpNamespace(ANcpLua.OtelConventions.Domains.Data.Db, "ANcpLua.OtelConventions.Domains.Data.Db");
@@csharpNamespace(ANcpLua.OtelConventions.Domains.Identity, "ANcpLua.OtelConventions.Domains.Identity");
@@csharpNamespace(ANcpLua.OtelConventions.Domains.Issues, "ANcpLua.OtelConventions.Domains.Issues");
@@csharpNamespace(ANcpLua.OtelConventions.Domains.Loom.Triage, "ANcpLua.OtelConventions.Domains.Loom.Triage");
@@csharpNamespace(ANcpLua.OtelConventions.Domains.Observe.Error, "ANcpLua.OtelConventions.Domains.Observe.Error");
@@csharpNamespace(ANcpLua.OtelConventions.Domains.Observe.Log, "ANcpLua.OtelConventions.Domains.Observe.Log");
@@csharpNamespace(ANcpLua.OtelConventions.Domains.Observe.Otel, "ANcpLua.OtelConventions.Domains.Observe.Otel");
@@csharpNamespace(ANcpLua.OtelConventions.Domains.Observe.Session, "ANcpLua.OtelConventions.Domains.Observe.Session");
@@csharpNamespace(ANcpLua.OtelConventions.Domains.Observe.Test, "ANcpLua.OtelConventions.Domains.Observe.Test");
@@csharpNamespace(ANcpLua.OtelConventions.Domains.Ops.Deployment, "ANcpLua.OtelConventions.Domains.Ops.Deployment");
@@csharpNamespace(ANcpLua.OtelConventions.Domains.Ops.Retention, "ANcpLua.OtelConventions.Domains.Ops.Retention");
@@csharpNamespace(ANcpLua.OtelConventions.Domains.Runtime.System, "ANcpLua.OtelConventions.Domains.Runtime.System");
@@csharpNamespace(ANcpLua.OtelConventions.Domains.Search, "ANcpLua.OtelConventions.Domains.Search");
@@csharpNamespace(ANcpLua.OtelConventions.Domains.Transport.Http, "ANcpLua.OtelConventions.Domains.Transport.Http");
@@csharpNamespace(ANcpLua.OtelConventions.Domains.Transport.Messaging, "ANcpLua.OtelConventions.Domains.Transport.Messaging");
@@csharpNamespace(ANcpLua.OtelConventions.Domains.Transport.Rpc, "ANcpLua.OtelConventions.Domains.Transport.Rpc");
@@csharpNamespace(ANcpLua.OtelConventions.Domains.Workflow, "ANcpLua.OtelConventions.Domains.Workflow");
@@csharpNamespace(ANcpLua.OtelConventions.Domains.Workspace, "ANcpLua.OtelConventions.Domains.Workspace");

@@csharpNamespace(ANcpLua.OtelConventions.OTel, "ANcpLua.OtelConventions.OTel");
@@csharpNamespace(ANcpLua.OtelConventions.OTel.Enums, "ANcpLua.OtelConventions.OTel.Enums");
@@csharpNamespace(ANcpLua.OtelConventions.OTel.Logs, "ANcpLua.OtelConventions.OTel.Logs");
@@csharpNamespace(ANcpLua.OtelConventions.OTel.Metrics, "ANcpLua.OtelConventions.OTel.Metrics");
@@csharpNamespace(ANcpLua.OtelConventions.OTel.Profiles, "ANcpLua.OtelConventions.OTel.Profiles");
@@csharpNamespace(ANcpLua.OtelConventions.OTel.Resource, "ANcpLua.OtelConventions.OTel.Resource");
@@csharpNamespace(ANcpLua.OtelConventions.OTel.Traces, "ANcpLua.OtelConventions.OTel.Traces");

@@csharpNamespace(ANcpLua.OtelConventions.Storage, "ANcpLua.OtelConventions.Storage");

// -----------------------------------------------------------------------------
// TypeScript brands for opaque string IDs. Mandate §Commit-4 exact list plus
// any scalar in common/types.tsp with x-csharp-struct extension.
// -----------------------------------------------------------------------------

@@tsBrand(ANcpLua.OtelConventions.Common.TraceId);
@@tsBrand(ANcpLua.OtelConventions.Common.SpanId);
@@tsBrand(ANcpLua.OtelConventions.Common.SessionId);
@@tsBrand(ANcpLua.OtelConventions.Common.UserId);
