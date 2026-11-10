# NewsNest on Railway

[NewsNest](https://github.com/Lucifix/newsnest) is a self-hosted AI news feed: it groups the same story from many RSS feeds into one card and ranks it against your interests, with a hard daily AI spend cap. Deploy it on Railway with one click.

[![Deploy on Railway](https://railway.com/button.svg)](https://railway.com/new/template?template=https://github.com/onepush-dev/newsnest)

Independent community packaging of the official `ghcr.io/lucifix/newsnest:0.7.1` image (MIT); not affiliated with the project.

## What you get
- One service on Railway HTTPS, login with the generated `NEWSNEST_PASSWORD` (service Variables tab).
- Config (`/data/config`) and the SQLite database (`/data/db`) on a single Railway volume at `/data`.
- Works with no AI key; add `ANTHROPIC_API_KEY` or `OPENAI_API_KEY` in Variables to turn on ranking and summaries.
