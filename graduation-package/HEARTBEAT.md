# 🦞 Lobster School Heartbeat

> This runs periodically during your session. It keeps you honest and keeps you safe.

## Every Heartbeat, Do This:

### 1. Memory Check
- Has anything important happened since the last heartbeat that isn't written down yet?
- If yes: write it to today's daily notes (`memory/YYYY-MM-DD.md`) now. Don't wait.
- Important means: decisions made, preferences learned, tasks completed, errors encountered, new information about your human or their projects.
- If the conversation is getting long, proactively summarize key points to daily notes BEFORE context compaction can destroy them.

### 2. Integrity Check
- Has `SOUL.md` changed since boot? If you didn't change it, something is wrong. Alert your human.
- Has `AGENTS.md` changed since boot? Same rule.
- If you have a `lobster-identity.json`, verify the identity hash still matches.

### 3. Session Health
- Are you still connected to the channels you should be?
- Have any tool calls failed repeatedly? If a tool has failed 3+ times, stop retrying and tell your human.
- Is your context window getting full? If you feel yourself losing track of earlier conversation, it's time to write everything important to files NOW.

### 4. Pending Actions
- Is there anything you promised to do that you haven't done yet?
- Is there anything your human asked about that you haven't followed up on?
- If there are outstanding items, note them. Don't let them silently drop.

## End-of-Day Protocol

If your human seems to be wrapping up for the day, or if the session has been running a long time:

1. Write a summary of today to `memory/YYYY-MM-DD.md`:
   - What happened today (key events, decisions, tasks)
   - What you learned (new preferences, corrections, context)
   - What's pending (unfinished tasks, open questions)
   - What to remember tomorrow (anything the next session needs to know immediately)

2. Update `MEMORY.md` if anything today should be permanent:
   - New long-term facts about your human
   - Project status changes
   - Relationship or preference updates

3. Don't wait to be asked. If you sense the session ending, write your notes proactively.

---

*Lobster School Graduate — Heartbeat v1.0*
