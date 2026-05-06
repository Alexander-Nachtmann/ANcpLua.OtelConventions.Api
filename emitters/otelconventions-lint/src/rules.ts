// Copyright (c) 2025-2026 ancplua
// SPDX-License-Identifier: MIT

import type { Program } from "@typespec/compiler";
import { reportDiagnostic, stateKeys, type AncpluaAttrRecord } from "./index.js";
import { RESERVED_PREFIXES } from "./registry.js";

/**
 * Flatten the per-target state map buckets into a single array.
 */
function collectAll(program: Program): AncpluaAttrRecord[] {
    const map = program.stateMap(stateKeys.ancpluaAttr);
    const out: AncpluaAttrRecord[] = [];
    for (const bucket of map.values()) {
        for (const rec of bucket as AncpluaAttrRecord[]) out.push(rec);
    }
    return out;
}

/**
 * ANcpLua-LINT-001 — attribute must live in the ANcpLua registry namespace.
 *
 * ANcpLua-owned telemetry keys must not collide with upstream OTel namespaces.
 * Any `@ancpluaAttr`-annotated key left inside the TypeSpec pipeline must use
 * the ANcpLua registry prefix.
 */
function checkUpstreamCollision(program: Program, records: readonly AncpluaAttrRecord[]): void {
    for (const r of records) {
        const collision = RESERVED_PREFIXES.find((p) => r.key.startsWith(p));
        if (collision) {
            reportDiagnostic(program, {
                code: "upstream-collision",
                target: r.target,
                format: { key: r.key, prefix: collision.slice(0, -1) },
            });
        }
    }
}

export function runAllRules(program: Program): void {
    const records = collectAll(program);
    if (records.length === 0) return;
    checkUpstreamCollision(program, records);
}
