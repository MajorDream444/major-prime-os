# MCP — FIRECRAWL

Type: HTTP MCP Server
URL: http://localhost:3002
Auth: Bearer fc-local

## Setup

Run Firecrawl via Docker:
```bash
docker run -p 3002:3002 firecrawl/firecrawl
```

## Wire into Claude

Add to ~/.claude.json under mcpServers:
```json
"firecrawl": {
  "type": "http",
  "url": "http://localhost:3002",
  "headers": {
    "Authorization": "Bearer fc-local"
  }
}
```

## Test
```bash
curl http://localhost:3002/health
```

## Key Endpoints
- POST /scrape — scrape a single URL
- POST /crawl — crawl a site
- POST /search — search the web
