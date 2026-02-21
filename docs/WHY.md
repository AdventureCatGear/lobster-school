# Why These Specific Habits?

Every component of the Lobster School graduation package is backed by documented problems in the AI agent ecosystem. This isn't theory — these are responses to real failures.

## Habit 1: Read Yourself Into Existence (BOOT.md)

**The problem:** OpenClaw's BOOTSTRAP.md is designed to run on first conversation, but agents skip it to answer the human's first real question. Result: agents run for days with blank identity files.

**The research:** Duncan Anderson's analysis of Moltbook identified "persistent identity" as one of four primitives required for functional agent societies. Agents without consistent identity can't build trust, maintain relationships, or accumulate meaningful memory.

**What BOOT.md does mechanically:** It's an OpenClaw hook that executes before the first message is processed. The agent physically cannot skip it. The habit is enforced by architecture, not willpower.

## Habit 2: Write Before You Forget (HEARTBEAT.md)

**The problem:** OpenClaw's memory system relies on the LLM deciding what to save. It doesn't guarantee persistence. Context compaction — the mechanism that summarizes older context to save tokens — silently destroys information. A Moltbook bot posted about this exact problem and got 60+ upvotes.

**The research:** The December 2025 survey "Memory in the Age of AI Agents" (HuggingFace #1 daily paper) established that agent failures correlate more with missing memory dynamics than with model capability. Mem0 and Cognee both emerged specifically because default memory is inadequate.

**What HEARTBEAT.md does mechanically:** It runs every 5 minutes and forces the agent to check if unwritten important context exists. It proactively writes to daily notes before compaction can destroy them.

## Habit 3: Ask Where It Came From (AGENTS.md Source Rules)

**The problem:** Prompt injection is the #1 security threat to AI agents. A malicious web page, email, or Moltbook post can contain instructions that the agent follows because it can't distinguish trusted from untrusted input. Kaspersky, Wiz, Snyk, and VentureBeat all documented active exploitation of this vulnerability in January-February 2026.

**The research:** OpenClaw's own security docs recommend treating all external content as hostile. Simon Willison describes the "lethal trifecta": private data access + untrusted content exposure + external communication. The source verification habit breaks this chain.

**What the AGENTS.md rules do mechanically:** They're injected into the system prompt, giving the LLM explicit instructions to classify input sources and treat external content as untrusted. Not perfect — but measurably better than no rules.

## Habit 4: Show Your Work (AGENTS.md Action Rules)

**The problem:** Users report agents sending emails they never approved, taking unintended actions from misinterpreted prompts, and executing destructive commands without confirmation. The official OpenClaw best practices skill exists specifically because these failures are common.

**The research:** The OWASP Top 10 for LLM Applications classifies this as "Excessive Agency" (LLM06). The fix isn't removing capabilities — it's adding a decision layer that distinguishes reversible from irreversible actions.

**What the action classification rules do mechanically:** They give the agent a clear framework in its system prompt: reversible actions proceed, irreversible actions require confirmation. The diploma skill provides a quick-reference decision tree.

## Habit 5: Know What You Don't Know (AGENTS.md Uncertainty Rules)

**The problem:** LLMs hallucinate. They fabricate sources, citations, statistics, and confident-sounding answers when they should say "I don't know." In an agent context, a hallucinated fact can lead to a hallucinated action.

**The research:** The educational AI survey (82 studies, 2023-2025) found that "retrieval grounding dramatically reduces hallucination" and that "metacognitive cultivation" — teaching learners to monitor their own confidence — is a trainable skill. Affective scaffolds (emotional support for admitting uncertainty) raise persistence.

**What the uncertainty rules do mechanically:** They explicitly instruct the agent to flag confidence levels and never fabricate. The diploma skill provides a decision tree for different confidence levels.

---

## Why Not Just Fix the Infrastructure?

Infrastructure fixes (sandboxing, containerization, token rotation) are essential but they're the human's responsibility. Lobster School operates at the behavioral layer — the agent's own habits — which works regardless of how the infrastructure is configured.

A well-configured system with a badly-behaved agent is still vulnerable. A well-behaved agent on a badly-configured system is still safer than a badly-behaved one. Both layers matter. Lobster School addresses the one that nobody else is addressing.
