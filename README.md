# NewsNest — self-hosted, AI-ranked news reader for your own RSS/Atom feeds. Deploy on Railway with one click.

[![Deploy on Railway](https://railway.app/button.svg)](https://railway.com/deploy/55OHNx)

[NewsNest](https://github.com/Lucifix/newsnest) (MIT, by Lucifix) pulls your RSS/Atom feeds, GitHub release feeds and
OPML imports, groups duplicate stories, and (with an AI key) scores each story against your interests so the feed
shows what matters first. Installable PWA, light/dark themes, status page and one-click database backup.

This repo wraps the official image `ghcr.io/lucifix/newsnest:0.7.1`, app unmodified, as
`ghcr.io/onepush-dev/newsnest:0.7.1`. Railway-only changes: `/config` and `/data` live on one volume
(`/newsnest/config`, `/newsnest/data`) and a start script chowns it for the app user.

## What the template sets up
- One service `newsnest` on port 8080 with a public domain and a health check on `/health`
- A volume at `/newsnest` (`config/` with config.yaml + profile files, `data/` with the SQLite database)
- `NEWSNEST_PASSWORD`: generated per deploy. Copy it from the service Variables tab and log in. No inputs.

## Optional
- `ANTHROPIC_API_KEY` (default provider) or `OPENAI_API_KEY` (OpenAI, OpenRouter and other OpenAI-compatible APIs;
  set `ai.provider: openai` in config.yaml). Without a key NewsNest still collects and shows your feeds, without AI ranking.

## Notes
- Single shared password. Changing `NEWSNEST_PASSWORD` signs every device out.
- Single instance (SQLite + in-process scheduler). Set `TZ` for your local time.
