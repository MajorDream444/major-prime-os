#!/bin/bash
# Scout runner — called by cron at 7am daily

set -euo pipefail

VAULT_DIR="$HOME/vault"
DATE=$(date +%Y-%m-%d)
LOG_FILE="$VAULT_DIR/scout-${DATE}.md"
FIRECRAWL_URL="http://localhost:3002"
FIRECRAWL_KEY="fc-local"

mkdir -p "$VAULT_DIR"

echo "# Scout Run — ${DATE}" >> "$LOG_FILE"
echo "" >> "$LOG_FILE"

# Health check — Firecrawl must be up
if ! curl -sf "${FIRECRAWL_URL}/health" > /dev/null 2>&1; then
  echo "## ERROR: Firecrawl not reachable at ${FIRECRAWL_URL}" >> "$LOG_FILE"
  send_telegram "Scout FAILED: Firecrawl offline at ${FIRECRAWL_URL}"
  exit 1
fi

echo "## Status: Firecrawl online" >> "$LOG_FILE"
echo "## Queries run at: $(date +%H:%M:%S)" >> "$LOG_FILE"
echo "" >> "$LOG_FILE"

# Scrape function
scrape_url() {
  local url="$1"
  curl -sf -X POST "${FIRECRAWL_URL}/scrape" \
    -H "Authorization: Bearer ${FIRECRAWL_KEY}" \
    -H "Content-Type: application/json" \
    -d "{\"url\": \"${url}\", \"formats\": [\"markdown\"]}" 2>/dev/null || echo "{}"
}

# Telegram notify function
send_telegram() {
  local msg="$1"
  if [ -n "${TELEGRAM_BOT_TOKEN:-}" ] && [ -n "${TELEGRAM_CHAT_ID:-}" ]; then
    curl -sf -X POST "https://api.telegram.org/bot${TELEGRAM_BOT_TOKEN}/sendMessage" \
      -d "chat_id=${TELEGRAM_CHAT_ID}" \
      -d "text=${msg}" > /dev/null 2>&1 || true
  fi
}

# Log placeholder — Claude runs actual scraping via MCP
echo "## Scout triggered. Claude MCP run pending." >> "$LOG_FILE"
echo "" >> "$LOG_FILE"
echo "_Run: claude --project major-prime-bot '/scout'_" >> "$LOG_FILE"

send_telegram "Major Prime OS: Daily scout triggered for ${DATE}. Check vault for results."

echo "Scout runner complete. Log: ${LOG_FILE}"
