# SCOUT CRON

Schedule:
0 7 * * *

Action:
- Run scout-medspa-buyer
- Trigger Firecrawl
- Output to vault
- Notify Telegram

## Install (one-liner — run this on your machine)

```bash
(crontab -l 2>/dev/null; echo "0 7 * * * ~/major-prime-os/SCRIPTS/scout-runner.sh >> /tmp/scout-cron.log 2>&1") | crontab -
```

## Verify
```bash
crontab -l
```

## Check logs
```bash
tail -f /tmp/scout-cron.log
```

## Env vars required (add to ~/.zshrc or ~/.bashrc so cron inherits them)
```bash
export TELEGRAM_BOT_TOKEN=your_token_here
export TELEGRAM_CHAT_ID=your_chat_id_here
```
