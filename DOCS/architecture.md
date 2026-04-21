# ARCHITECTURE

## System Map

```
Claude Code
    |
    v
OpenClaw Gateway (port 8080)
    |
    ├── OpenRouter (LLM routing)
    ├── Firecrawl MCP (port 3002) — web scraping
    ├── Airtable — lead database
    └── Notion — deal board

Agents:
    ├── scout-medspa-buyer — daily lead discovery
    └── state-keeper — session memory + snapshots

Notifications:
    └── Telegram Bot — daily summaries + alerts
```

## Data Flow

```
Scout Agent
  → Firecrawl scrape
    → Extract (name, website, contact)
      → Score opportunity
        → Log to Airtable
          → Notify Telegram
```

## Key Paths

| Component      | Location                    |
|----------------|-----------------------------|
| Claude config  | ~/.claude.json              |
| OpenClaw config| ~/.openclaw/openclaw.json   |
| Agent skills   | AGENTS/                     |
| Workflows      | WORKFLOWS/                  |
| Cron           | CRON/                       |
| State          | STATE/STATE_SNAPSHOT.md     |
