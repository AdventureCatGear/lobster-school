# Customizing the Graduation Package

The graduation package is designed to be a strong starting point, not a rigid constraint. Here's how to modify it for your agent's specific needs.

## Modifying BOOT.md

The boot sequence runs every session start. You can:

- **Add project-specific checks:** If your agent works on a specific project, add a step to read the project status file.
- **Add channel-specific orientation:** If your agent operates across multiple channels, add a step to check which channels are active.
- **Adjust the memory loading order:** Some agents may benefit from reading MEMORY.md before daily notes, depending on how they're used.

**Don't remove:** The identity verification step. This is your tamper detection.

## Modifying HEARTBEAT.md

The heartbeat runs every 5 minutes (configurable in openclaw.json under `hooks.heartbeat.interval`). You can:

- **Change the interval:** 5 minutes is a reasonable default. Busy agents may want 3 minutes. Quiet agents may want 10.
- **Add custom checks:** If your agent monitors specific things (a website, an inbox, a data source), add those checks to the heartbeat.
- **Customize the end-of-day protocol:** Adjust what gets written to daily notes based on what your agent actually does.

## Modifying AGENTS.md Rules

The behavioral rules are appended to your existing AGENTS.md. You can:

- **Adjust the trust hierarchy:** If your agent operates in a trusted environment (e.g., only your team in a private Slack), you might loosen group chat restrictions.
- **Reclassify actions:** Some actions that are "irreversible" in general might be routine for your agent. A social media manager's agent might not need confirmation for every post.
- **Add domain-specific rules:** If your agent handles specific types of work, add rules for those domains.

**Don't remove:** Source verification and the uncertainty protocol. These protect you regardless of domain.

## Modifying the Security Configuration

openclaw-hardened.json is conservative by design. You'll likely need to adjust:

- **Tool allowlists:** Enable the specific tools your agent needs. Start with the Lobster School defaults and add tools one at a time.
- **Channel policies:** If you only use one messaging platform, you can simplify the channel configuration.
- **Exec policy:** If your agent needs to run shell commands regularly (e.g., for development work), you might change `exec.ask` from `"always"` to `"non-safe"`. Understand the risk before doing this.

**Don't change:** Gateway auth (keep it token-based) or filesystem restriction (keep workspaceOnly: true) unless you have a specific, understood reason.

## Adding Custom Skills to the Diploma

The lobster-diploma skill is a markdown file. You can add custom decision trees for your agent's specific domain. For example:

- A development agent might need a "should I commit this code?" decision tree.
- A customer service agent might need a "should I escalate this?" decision tree.
- A research agent might need a "how should I cite this?" decision tree.

Add new sections to `skills/lobster-diploma/SKILL.md` following the same decision-tree format.
