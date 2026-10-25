# GO / HOLD Table — Major Prime OS Reconciliation
Date: 2026-10-25
Author: Claude Code
Review required: Founder (Major Dream Williams)

---

## LEGEND
- **GO** — safe to proceed without additional approval
- **HOLD** — requires founder approval before proceeding
- **BLOCKED** — cannot proceed until dependency resolved
- **FLAG** — known gap, do not claim this works

---

## System Actions

| # | Action | Status | Condition / Dependency |
|---|--------|--------|----------------------|
| 1 | Read reconciliation handover + Yawdie spec | GO | No approval needed — read-only |
| 2 | Update STATE_SNAPSHOT.md with honest status | GO | Local machine only |
| 3 | Install cron on local machine | GO | Local machine only — no repo change |
| 4 | Patch `~/.openclaw/openclaw.json` skill root | GO | Local machine, Python json module only |
| 5 | Copy scout-medspa-buyer skill to `~/.openclaw/workspace/skills/` | GO | Local machine only |
| 6 | Fix `scout-runner.sh` to call Claude (not just log placeholder) | GO | Local machine — caveman edit only |
| 7 | Run `python3 runtime/yawdie/worker.py report` | GO | Local machine — read only |
| 8 | Copy `.mcp.json` Firecrawl pattern to Command repo | GO | Minor file addition — no existing file changes |
| 9 | Copy `AGENTS/scout-medspa-buyer/SKILL.md` to Command repo `.agents/skills/` | GO | Additive only |
| 10 | Copy `WORKFLOWS/bwyh-lead-flow.md` to Command repo `docs/workflows/` | GO | Additive only |

---

## Integration Activations

| # | Integration | Status | Condition / Dependency |
|---|------------|--------|----------------------|
| 11 | Firecrawl (localhost:3002) | BLOCKED | Must be running on local machine; ECONNREFUSED in web env |
| 12 | OpenClaw (port 8080) | BLOCKED | Must be running on local machine; not present in web env |
| 13 | Telegram bot | BLOCKED | TELEGRAM_BOT_TOKEN must be set and verified |
| 14 | WhatsApp outbound | BLOCKED | Known formatting issue — not resolved |
| 15 | Airtable | BLOCKED | API key not set; base schema not defined |
| 16 | Ollama inference (Yawdie worker) | BLOCKED | Cannot reach localhost:11434 in web env; verify on local machine |
| 17 | Claude Code CLI scout (`claude --project major-prime-bot '/scout'`) | BLOCKED | Requires Claude Code CLI + auth on local machine |
| 18 | Substack publishing adapter | HOLD | Requires founder approval; publication = consequential external action |
| 19 | Stripe/Resend webhook | HOLD | Existing bypass value; requires founder approval to fix |

---

## Branch / Merge Actions

| # | Action | Status | Condition / Dependency |
|---|--------|--------|----------------------|
| 20 | Merge `claude/setup-repo-structure-7BKxl` wholesale to main | HOLD | Founder approval required; selective carry is preferred |
| 21 | Selective PR: carry `.mcp.json` + scout skill + BWYH flow to Command repo | HOLD | Founder approval required before opening PR |
| 22 | Create new Foundry Sports scaffold repo | HOLD | Founder confirmation on whether repo exists or should be created |
| 23 | Deploy Yawdie worker as persistent local service | HOLD | Founder approval; requires process supervisor config on local machine |
| 24 | Activate 12-agent autonomous daily dispatch | HOLD | Not implemented; requires full adapter chain; founder approval required |

---

## Autonomy Activations

| # | Action | Status | Condition / Dependency |
|---|--------|--------|----------------------|
| 25 | Activate autonomous outreach (email/DM/social) | HOLD | **Explicit founder approval required — no exceptions** |
| 26 | Deploy new control plane | HOLD | **Explicit founder approval required** |
| 27 | Overwrite local OpenClaw config | HOLD | **Explicit founder approval required** |
| 28 | Any live social publish | HOLD | Account adapters not connected; publication adapter not built |
| 29 | Any Airtable/Notion write from agent | HOLD | No API keys set; no scoped permissions defined |
| 30 | Any paid API activation (non-local model) | HOLD | **Explicit budget and billing route required before activation** |

---

## Summary

| Category | GO | HOLD | BLOCKED |
|----------|----|------|---------|
| System actions (local machine) | 6 | 0 | 4 |
| Integrations | 0 | 2 | 7 |
| Branch / merge | 0 | 5 | 0 |
| Autonomy activations | 0 | 6 | 0 |
| **TOTAL** | **6** | **13** | **11** |

**6 actions** are safe to take right now on your local machine.
**13 actions** require your approval before proceeding.
**11 actions** are blocked on local environment dependencies.

---

*No HOLD or BLOCKED item has been executed. This table is a decision-support document.*
