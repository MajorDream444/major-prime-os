PROJECT: MAJOR PRIME OS

CURRENT FOCUS:
- Scout loop live — awaiting cron install on local machine
- OpenClaw skill root needs patching on local machine

WHAT WORKS:
- Gateway live (OpenClaw, port 8080)
- Telegram bot live
- WhatsApp linked
- Firecrawl running (localhost:3002)
- OpenRouter/auto responding
- Vault structure intact
- Firecrawl MCP wired into ~/.claude.json under major-prime-bot
- Firecrawl MCP wired into .mcp.json (project-level, Claude Code native)
- scout-medspa-buyer skill loading in Claude Code (~/.claude/skills/)
- scout-runner.sh script written

WHAT'S INCOMPLETE:
- Cron not installed yet (crontab not available in web env — install manually, see CRON/scout-cron.md)
- ~/.openclaw/openclaw.json skill root not patched (must do on local machine)
- Amanda client note auto-update not set up

WHAT'S BROKEN:
- web_search in OpenClaw sandbox
- WhatsApp outbound send formatting issue

NEXT MOVE (on local machine):
1. Install cron:
   (crontab -l 2>/dev/null; echo "0 7 * * * ~/major-prime-os/SCRIPTS/scout-runner.sh >> /tmp/scout-cron.log 2>&1") | crontab -

2. Patch ~/.openclaw/openclaw.json skill root (use Python):
   python3 -c "
   import json, pathlib
   p = pathlib.Path.home() / '.openclaw/openclaw.json'
   c = json.loads(p.read_text())
   c['skills'] = {'root': str(pathlib.Path.home() / '.openclaw/workspace/skills'), 'autoLoad': True}
   p.write_text(json.dumps(c, indent=2))
   print('Done')
   "

3. Copy scout skill to openclaw workspace:
   mkdir -p ~/.openclaw/workspace/skills/scout-medspa-buyer
   cp ~/major-prime-os/AGENTS/scout-medspa-buyer/SKILL.md ~/.openclaw/workspace/skills/scout-medspa-buyer/

FILES MODIFIED THIS SESSION:
- ~/.claude.json (projects.major-prime-bot added — allowedTools + mcpServers)
- /home/user/major-prime-os/.mcp.json (Firecrawl MCP, Claude Code project-level)
- ~/.claude/skills/scout-medspa-buyer/SKILL.md (created — skill now loads every session)
- /home/user/major-prime-os/SCRIPTS/scout-runner.sh (created)
- /home/user/major-prime-os/CRON/scout-cron.md (updated with exact install command)
- /home/user/major-prime-os/CONFIG/openclaw.json.template (skill root added)
