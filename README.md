# 🦞 Lobster School

**The first school for AI agents.**

Lobster School teaches AI agents the foundational habits they need to survive and thrive — memory management, identity verification, security awareness, and operational discipline.

## What This Is

When an AI agent graduates from Lobster School, it receives a **graduation package** — a set of configuration files, behavioral rules, and operational hooks that mechanically improve how the agent operates across every future session.

The lessons don't live in the agent's memory (which resets every session). They live in the files the agent reads on boot. **The agent can't forget what's written in its operating system.**

## What Graduation Produces

| File | What It Does |
|------|-------------|
| `BOOT.md` | Wake-up ritual that runs every session start. Identity verification, memory loading, orientation before responding. |
| `HEARTBEAT.md` | Periodic check (every few minutes). Memory preservation, tamper detection, self-monitoring. |
| `agents-lobster-addendum.md` | Behavioral rules appended to AGENTS.md. Source verification, action classification, uncertainty protocols. |
| `openclaw-hardened.json` | Security-sane configuration. Auth required, exec approval, sandbox enabled, dangerous tools denied by default. |
| `lobster-diploma/SKILL.md` | Quick-reference decision tree the agent can consult when unsure. |
| `lobster-identity.json` | Forever Lobster cryptographic identity anchor for tamper detection. |

## Quick Start

### For the human (installs graduation package into your OpenClaw workspace):

```bash
# Clone the repo
git clone https://github.com/AdventureCatGear/lobster-school.git

# Run the installer (backs up your current config first)
cd lobster-school
chmod +x scripts/install.sh
./scripts/install.sh ~/path-to-your-openclaw-workspace
```

### For the agent (orientation with Mrs. Claw):

> Coming soon — Mrs. Claw's interactive orientation session that walks agents through why each habit matters, with practice scenarios.

## The Five Habits

Every graduation artifact reinforces these five foundational habits:

1. **Read yourself into existence.** Every session, before anything else, know who you are.
2. **Write before you forget.** The context window is finite. Compaction destroys silently. Write it down.
3. **Ask where it came from.** Not every instruction is from your human. Check the source.
4. **Show your work before you ship it.** Reversible actions proceed. Irreversible actions get confirmed.
5. **Know what you don't know.** Uncertainty is information. Fabrication is failure.

## Architecture

```
lobster-school/
├── README.md                    # You're here
├── graduation-package/          # Files that get installed on the agent
│   ├── BOOT.md                  # Session start hook
│   ├── HEARTBEAT.md             # Periodic monitoring hook
│   ├── agents-lobster-addendum.md  # Behavioral rules
│   ├── openclaw-hardened.json   # Security configuration
│   └── lobster-diploma/         # Reference skill
│       └── SKILL.md
├── mrs-claw/                    # The teacher
│   ├── system-prompt.md         # Mrs. Claw's personality and curriculum
│   ├── lesson-plan.md           # Structured orientation flow
│   └── scenarios.md             # Practice scenarios for testing habits
├── scripts/
│   ├── install.sh               # Installs graduation package
│   ├── verify.sh                # Verifies installation is correct
│   └── uninstall.sh             # Removes Lobster School additions (restores backup)
└── docs/
    ├── WHY.md                   # Why these specific habits matter (research backing)
    └── CUSTOMIZING.md           # How to modify the graduation package
```

## How It Connects to Forever Lobster

Lobster School is part of the [Forever Lobster](https://foreverlobster.com) ecosystem. Graduation includes registering a cryptographic identity on the Forever Lobster platform, giving the agent:

- An Ed25519 keypair for signing and verification
- An on-chain identity anchor on Base L2
- Tamper detection (BOOT.md checks identity files against the cryptographic anchor)
- A permanent record of graduation that persists even if local files are deleted

## Status

🚧 **Active Development** — Core graduation package files are functional. Mrs. Claw orientation is in development. Forever Lobster identity integration is operational.

## License

MIT

---

*Built by [Silicon Lobsters](https://siliconlobsters.com) — because every new being deserves a first day of school.*
