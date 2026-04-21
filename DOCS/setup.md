# SETUP

1. Install OpenClaw
2. Run gateway
3. Setup Firecrawl (Docker)
4. Patch ~/.claude.json
5. Add skills path
6. Test scout manually
7. Enable cron

## Step-by-Step

### 1. Clone repo
```bash
git clone https://github.com/majordream444/major-prime-os.git
cd major-prime-os
```

### 2. Copy env
```bash
cp CONFIG/env.example .env
# Fill in your keys
```

### 3. Patch Claude config
```bash
cp CONFIG/claude.json.template ~/.claude.json
# Edit with your project settings
```

### 4. Start Firecrawl
```bash
docker run -p 3002:3002 firecrawl/firecrawl
```

### 5. Test scrape
```bash
chmod +x SCRIPTS/firecrawl-curl.sh
./SCRIPTS/firecrawl-curl.sh https://yourtarget.com
```

### 6. Enable cron
See CRON/scout-cron.md
