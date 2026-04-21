# SCOUT CRON

Schedule:
0 7 * * *

Action:
- Run scout-medspa-buyer
- Trigger Firecrawl
- Output to vault
- Notify Telegram

## Install

Add to crontab:
```bash
crontab -e
```

Add line:
```
0 7 * * * /path/to/major-prime-os/SCRIPTS/firecrawl-curl.sh >> /var/log/scout.log 2>&1
```

## Verify
```bash
crontab -l
```
