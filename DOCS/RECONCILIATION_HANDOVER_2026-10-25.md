# Major Prime OS — Cross-Repository Reconciliation Handover
Date: 2026-10-25
Author: Claude Code (reconciliation session)
Status: HANDOVER — for founder review before any merge or activation

---

## 1. Scope

Two repositories audited side-by-side:

| Repo | Branch | Files | Role |
|------|--------|-------|------|
| `MajorDream444/major-prime-os` | `claude/setup-repo-structure-7BKxl` | 18 | Lightweight scout + BWYH lead flow scaffold |
| `MajorDream444/Major-OS-AMA-OS--Command` | `main` | 80+ | Mature Command Center — Stage A Foundation |

---

## 2. Founder Decisions (Canonical, Established Prior Sessions)

1. Major Prime OS = candidate private ecosystem-wide Command Center
2. Yawdie = Chief of Staff, lead monitoring agent (ChatGPT embodiment)
3. System oversees MAIM, AMA Solutions, and Major Dream Williams
4. HAMAL = operational agent organization under AMA (H01–H12 seats)
5. Foundry OS belongs to AMA (EV/Mobility, Gold/Mining, Agriculture, Fisheries, Sports)
6. MAIM owns Academy, Design Studio, Spark Lab, books, 52 in 52
7. Major Dream owns personal branding, lifestyle ventures, Marine Foundation impact work

---

## 3. Audit: major-prime-os Branch (18 Files)

| File | Status | Notes |
|------|--------|-------|
| README.md | OK | Accurate lightweight overview |
| PROJECT_BRIEF.md | OK | Mission + stack + constraints |
| .mcp.json | OK | Firecrawl wired at project level (Claude Code native) |
| STATE/STATE_SNAPSHOT.md | STALE CLAIMS | Claims OpenClaw, Telegram, WhatsApp, Firecrawl "live" — not verified |
| AGENTS/scout-medspa-buyer/SKILL.md | OK | Solid medspa scout skill — PRESERVE |
| AGENTS/state-keeper/PROMPT.md | OK | State Keeper prompt — PRESERVE |
| SCRIPTS/scout-runner.sh | INCOMPLETE — SEE FLAG | Does NOT execute Claude workflow |
| SCRIPTS/firecrawl-curl.sh | OK | Requires `jq` on local machine |
| CRON/scout-cron.md | OK | Install command documented — not yet installed |
| CONFIG/openclaw.json.template | OK | Skill root template |
| CONFIG/env.example | OK | All required env vars listed |
| WORKFLOWS/bwyh-lead-flow.md | OK | 4-stage BWYH flow |
| WORKFLOWS/scout-daily.md | OK | 5-step scout flow spec |
| DOCS/architecture.md | OK | System map accurate for current scope |

### CRITICAL FLAG — scout-runner.sh Does NOT Scout

`SCRIPTS/scout-runner.sh` checks Firecrawl health and sends a Telegram notification.
It does **not** execute the Claude scouting workflow.
Line 48 logs: `"Scout triggered. Claude MCP run pending."` — this is a placeholder.
Line 50 shows the intended next step: `claude --project major-prime-bot '/scout'`
**That command is never called by the script.**
The daily cron as written will fire Telegram notifications with zero actual lead scraping.

---

## 4. Audit: Major-OS-AMA-OS--Command (Key Files)

| File | Status | Notes |
|------|--------|-------|
| AGENT_REGISTRY.md | READY/IDLE | 10 agents, 5 Mobs — no live execution |
| COMMAND_CENTER_ARCHITECTURE_V2.md | DESIGN | Orchestration nervous system — simulation only |
| docs/YAWDIE_OPERATING_CHARTER_2026-10-15.md | CANONICAL | Founder-approved charter — authoritative |
| docs/YAWDIE_RUNTIME_HANDOFF_2026-10-15.md | TESTED | Worker tested, not deployed as service |
| runtime/yawdie/worker.py | TESTED | SQLite spool, Ollama inference, 12 seats defined |
| docs/HAMAL_CURRENT_STATE_SYNTHESIS.md | CANONICAL | Doctrine brain, routing rules, anti-silo rules |
| docs/OPENCLAW_AGENT_CONTRACT.md | DESIGN | Contract defined, execution NOT implemented |
| docs/EXTERNAL_SYSTEMS.md | DESIGN | Substack Engine, Client Clarity Intake — artifact import only |
| WORKFLOW_REGISTRY.md | DESIGN | 10 workflows mapped, all require Major approval |
| docs/RISK_GOVERNANCE.md | DESIGN | Governance rules — no live publish authority |

---

## 5. Duplication Analysis

| Capability | major-prime-os | Major-OS-AMA-OS--Command | Recommendation |
|-----------|----------------|--------------------------|----------------|
| Scout agent | `AGENTS/scout-medspa-buyer/SKILL.md` | A001 Scout (Revenue Mob) | Medspa scope in major-prime-os is narrower and concrete. A001 is the canonical agent slot. CONSOLIDATE: move medspa buyer as a sub-skill under A001. |
| State memory | State Keeper (PROMPT.md) | H02 Memory & Knowledge Steward | Same function, different names. CONSOLIDATE: State Keeper → H02 sub-task. |
| Daily brief | scout-runner.sh (placeholder) | `docs/DAILY_BRIEF_PROTOCOL.md` + worker.py morning/evening brief | Command repo has full protocol + working implementation. SUPERSEDE: use Command repo. |
| Firecrawl MCP | `.mcp.json` + `~/.claude.json` | Not yet wired | major-prime-os has working wiring. MIGRATE: bring `.mcp.json` pattern to Command repo. |
| OpenClaw contract | `CONFIG/openclaw.json.template` | `docs/OPENCLAW_AGENT_CONTRACT.md` | Command repo contract is more complete. KEEP both; template serves local machine setup. |
| BWYH lead flow | `WORKFLOWS/bwyh-lead-flow.md` | A001 Scout → A006 Outreach path | major-prime-os BWYH is medspa-specific. Command repo is general. KEEP both; BWYH = medspa sub-workflow. |
| Yawdie / Chief of Staff | Not present | Full charter + runtime worker | Command repo is authoritative. NOT present in major-prime-os. |

---

## 6. Live Integration Status

Verified 2026-10-25 in web environment (honest assessment):

| Integration | Claimed "Live" in STATE_SNAPSHOT | Actual Status |
|------------|----------------------------------|---------------|
| OpenClaw (port 8080) | Yes | NOT LIVE in web env. Lives on local machine. `~/.openclaw/` absent in container. |
| Firecrawl (localhost:3002) | Yes | NOT LIVE in web env. ECONNREFUSED. Must be running on local machine. |
| Telegram bot | Yes | NOT VERIFIED. `TELEGRAM_BOT_TOKEN` not set in web env. |
| WhatsApp | Yes | NOT VERIFIED. No active connection in this env. |
| Airtable | Not claimed | NOT CONNECTED. No API key set. |
| Cron (7am scout) | Documented only | NOT INSTALLED. `crontab` not available in web env. Must install on local machine. |
| Claude skills (`~/.claude/skills/`) | Claimed working | NOT PRESENT in this container. Fresh container = no persisted skills. |
| `~/.claude.json` patches | Claimed done | NOT PRESENT in this container. Fresh container = clean state. |

**Conclusion:** The STATE_SNAPSHOT reflects what was configured in a previous local session. A new web container starts clean. Nothing is live in this environment. Claims of "live" require verification on the local machine.

---

## 7. Repo Relationship Recommendation

```
Major-OS-AMA-OS--Command (main)
  └── Authority: orchestration doctrine, Yawdie charter, HAMAL, agent registry
  └── Runtime: worker.py (tested, needs local deployment)
  └── Missing: Firecrawl MCP wiring, medspa scout sub-skill

major-prime-os (claude/setup-repo-structure-7BKxl)
  └── Contribution: Firecrawl .mcp.json pattern, medspa BWYH scout skill
  └── Gap: scout-runner.sh incomplete, no Yawdie spec, no HAMAL doctrine
  └── Recommendation: merge selectively (not wholesale)
```

**Safe merge plan** — see Section 9.

---

## 8. Foundry Sports Asset Inventory

No dedicated Foundry Sports repository was found in the current session's accessible scope (`MajorDream444`). 

Foundry OS is defined as belonging to AMA: EV/Mobility, Gold/Mining, Agriculture, Fisheries, Sports.
Foundry Sports likely lives as a sub-vertical of Foundry OS — not yet scaffolded as its own repo.

**Action required (founder):** Confirm whether Foundry Sports has a separate repo or lives under a Foundry OS repo. If neither exists, it should be scaffolded under the AMA Command repo as a workspace/vertical, not as a standalone repo.

---

## 9. Safe PR / Merge Plan

**DO NOT** merge the branch wholesale. It would overwrite nothing useful but adds confusion about authority.

### What to carry from major-prime-os → Command repo

| Item | Action | Notes |
|------|--------|-------|
| `.mcp.json` Firecrawl wiring | COPY to Command repo root | Proven pattern for Claude Code project-level MCP |
| `AGENTS/scout-medspa-buyer/SKILL.md` | COPY to Command repo `.agents/skills/` or `.claude/skills/` | Register under A001 as `scout-medspa-buyer` sub-skill |
| `WORKFLOWS/bwyh-lead-flow.md` | COPY to Command repo `docs/workflows/` | BWYH = medspa-specific Revenue Mob workflow |
| `CONFIG/env.example` | MERGE with Command repo's env documentation | Add OPENCLAW_PORT, FIRECRAWL_API_KEY |
| `CRON/scout-cron.md` | KEEP in major-prime-os as local machine install guide | Not needed in Command repo |

### What to leave in major-prime-os

- `SCRIPTS/scout-runner.sh` — fix the incomplete scout execution first (see Section 10)
- `STATE/STATE_SNAPSHOT.md` — update to reflect honest status (see Section 10)
- `CONFIG/openclaw.json.template` — useful for local machine setup docs

### What to abandon / supersede

- The major-prime-os State Keeper → use Command repo H02 Memory & Knowledge Steward
- The major-prime-os daily brief placeholder → use Command repo `DAILY_BRIEF_PROTOCOL.md` + worker.py

---

## 10. Immediate Action Items (Local Machine Required)

These cannot be done in the web environment:

1. **Fix scout-runner.sh** — either call `claude --project major-prime-bot '/scout'` for real, or document it as a trigger-only script requiring manual Claude invocation.
2. **Install cron** — `(crontab -l 2>/dev/null; echo "0 7 * * * ~/major-prime-os/SCRIPTS/scout-runner.sh >> /tmp/scout-cron.log 2>&1") | crontab -`
3. **Patch `~/.openclaw/openclaw.json`** — skill root to `~/.openclaw/workspace/skills` with autoLoad.
4. **Verify Telegram bot token** — set `TELEGRAM_BOT_TOKEN` and `TELEGRAM_CHAT_ID` in env.
5. **Run Yawdie worker** — `python3 runtime/yawdie/worker.py --state ~/.local/share/hamal-yawdie report` to confirm Ollama model is installed and reachable.
6. **Update STATE_SNAPSHOT** — reflect honest status after each local session.

---

## 11. Private Command Center MVP

Minimal viable Command Center for founder daily use:

| Layer | What | Where |
|-------|------|-------|
| Authority | Yawdie charter + HAMAL doctrine | Command repo (already exists) |
| Daily brief | worker.py morning/evening JSON brief | Command repo runtime/yawdie (needs local deploy) |
| Scout loop | scout-runner.sh → actual Claude `/scout` call | major-prime-os SCRIPTS (needs fix) |
| Lead tracking | Airtable (BWYH pipeline) | Needs API key + base setup |
| State memory | STATE_SNAPSHOT.md → H02 Memory Steward | Both repos (needs consolidation) |
| Notifications | Telegram (scout results + daily brief) | Needs TELEGRAM_BOT_TOKEN on local machine |

**MVP sequence:**
1. Fix scout-runner.sh (actually runs scout)
2. Deploy Yawdie worker locally (morning/evening brief files)
3. Connect Telegram for notifications
4. Manually review Airtable for lead tracking
5. Merge Firecrawl MCP pattern to Command repo

This is NOT a full autonomous system. It is a local-running daily brief + scout trigger + manual review loop. That is the honest MVP.

---

*This handover document is for founder review only. No merge, deployment, or outreach activation has occurred.*
