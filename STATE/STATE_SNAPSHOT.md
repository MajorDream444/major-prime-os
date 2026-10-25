PROJECT: MAJOR PRIME OS
Last updated: 2026-10-25 (reconciliation session)

CURRENT FOCUS:
- Cross-repository reconciliation complete — see DOCS/RECONCILIATION_HANDOVER_2026-10-25.md
- Yawdie Chief of Staff spec written — see DOCS/YAWDIE_CHIEF_OF_STAFF_SPEC.md
- GO/HOLD table published — see DOCS/GO_HOLD_TABLE_2026-10-25.md

HONEST STATUS (verified 2026-10-25 in web env):
- OpenClaw: NOT LIVE IN WEB ENV — must be running on local machine
- Firecrawl: NOT LIVE IN WEB ENV — ECONNREFUSED — must be running on local machine
- Telegram: NOT VERIFIED — TELEGRAM_BOT_TOKEN not set in this env
- WhatsApp: NOT VERIFIED — no active connection in this env
- Cron: NOT INSTALLED — web env has no crontab
- ~/.claude/skills/scout-medspa-buyer/: NOT PRESENT — fresh container, not persisted
- ~/.claude.json patches: NOT PRESENT — fresh container, clean state
- Airtable: NOT CONNECTED — no API key set

WHAT IS WIRED (repo files only, not runtime):
- .mcp.json: Firecrawl MCP at project level (Claude Code native) — READY when Firecrawl runs locally
- AGENTS/scout-medspa-buyer/SKILL.md: skill definition — READY to install
- SCRIPTS/scout-runner.sh: INCOMPLETE — fires Telegram notification but does NOT execute Claude scouting workflow (placeholder only)

CRITICAL FLAG — scout-runner.sh:
  Line 48: logs "Scout triggered. Claude MCP run pending." — PLACEHOLDER ONLY
  Line 50: shows intended command but NEVER CALLS IT
  Fix: replace placeholder with: claude --project major-prime-bot "Run scout-medspa-buyer..."

NEXT MOVES (local machine — in priority order):
1. Fix scout-runner.sh to actually call Claude
2. Install cron:
   (crontab -l 2>/dev/null; echo "0 7 * * * ~/major-prime-os/SCRIPTS/scout-runner.sh >> /tmp/scout-cron.log 2>&1") | crontab -
3. Patch ~/.openclaw/openclaw.json skill root (Python json module only):
   python3 -c "
   import json, pathlib
   p = pathlib.Path.home() / '.openclaw/openclaw.json'
   c = json.loads(p.read_text())
   c['skills'] = {'root': str(pathlib.Path.home() / '.openclaw/workspace/skills'), 'autoLoad': True}
   p.write_text(json.dumps(c, indent=2))
   print('Done')
   "
4. Copy scout skill to openclaw workspace:
   mkdir -p ~/.openclaw/workspace/skills/scout-medspa-buyer
   cp ~/major-prime-os/AGENTS/scout-medspa-buyer/SKILL.md ~/.openclaw/workspace/skills/scout-medspa-buyer/
5. Run Yawdie worker report (from Major-OS-AMA-OS--Command repo):
   python3 runtime/yawdie/worker.py --state ~/.local/share/hamal-yawdie report

FILES ADDED THIS SESSION:
- DOCS/RECONCILIATION_HANDOVER_2026-10-25.md (cross-repo audit + merge plan)
- DOCS/YAWDIE_CHIEF_OF_STAFF_SPEC.md (full Yawdie spec)
- DOCS/GO_HOLD_TABLE_2026-10-25.md (GO/HOLD decision table)
- STATE/STATE_SNAPSHOT.md (this file — updated to honest status)

DO NOT CLAIM ANYTHING IS LIVE WITHOUT VERIFICATION RECEIPTS.
