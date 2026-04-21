#!/bin/bash
# Firecrawl — quick scrape via curl

URL="${1:-https://example.com}"
FC_URL="http://localhost:3002"
FC_KEY="fc-local"

curl -s -X POST "$FC_URL/scrape" \
  -H "Authorization: Bearer $FC_KEY" \
  -H "Content-Type: application/json" \
  -d "{\"url\": \"$URL\", \"formats\": [\"markdown\"]}" | jq .
