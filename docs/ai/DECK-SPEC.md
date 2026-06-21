# Creative Brief & Build Spec — "Beyond the Chat Box"
### An illustrated reference deck on using AI / LLMs in real life
**For:** CloudHealth TAMs · informal internal call · June 2026
**Status:** Specification for production. Hand this whole document to ChatGPT (GPT‑5 / GPT‑4o with image generation) to generate the art and assemble the deck.
**Note on authorship:** The slide list, headlines, and visual concepts here are *recommendations*. Keep, cut, reorder, or rewrite freely.

---

## 0 · How to use this document with OpenAI

**Recommended workflow (≈30–45 min in ChatGPT):**

1. **Lock the look first.** Paste §3 (Creative Direction) and ask GPT to generate **one reference image of the mascot** (the lobster guide). Iterate until you love it. Save that image — it's your style anchor.
2. **Generate hero art per slide.** For each slide in §4, paste the **HERO PROMPT** *plus* the mascot reference image and the master style line from §3. Ask for **16:9**. Re‑attach the reference each time so the character stays consistent.
3. **Assemble.** Drop the finished hero images into **Google Slides or PowerPoint** on a dark master, add the headline + labels from §4 using the type in §3. (Or use Gamma/Canva if you'd rather it auto‑lay‑out.)
4. **Fact‑check against §5** so nothing is stale — model names and numbers move fast.

**One‑paste kickoff prompt for ChatGPT:**
> "You're my art director and deck builder. I'm making a 9‑slide illustrated reference deck called *Beyond the Chat Box* for a casual internal call. I'll paste a creative brief. First, generate ONE reference image of the recurring mascot described under 'The Guide,' 16:9, in the exact style specified. We'll iterate on that, then build each slide's hero image from the per‑slide prompts, keeping the character and style identical. Ask me anything ambiguous before generating. Ready for the brief?"

---

## 1 · Project brief

| | |
|---|---|
| **What** | A flip‑through **reference deck** (not a training manual) that demystifies how to actually use LLMs — beyond the chat website. |
| **Audience** | CloudHealth Technical Account Managers. Mixed levels: a few are already running local models/agents; several have barely touched AI. |
| **Setting** | Informal, agenda‑less 45‑min group call ("show & tell"). **This deck powers one ~15‑min portion** — the presenter talks over it and references slides; it is **not** a self‑running lecture. |
| **Goals** | (1) Demystify the components & terms. (2) Show the route *beyond the chat portal* — running, owning, and orchestrating your own AI. (3) Share what the presenter is already doing. (4) Spark discussion. |
| **Tone** | Casual, confident, a little playful. Visual‑first. One idea per slide. |
| **Success** | A beginner leaves with a clear mental model and a next step; an experienced person feels it's accurate and current; nobody is bored by a wall of bullets. |

---

## 2 · Requirements (the non‑negotiables)

- **Visuals dominate; text is minimal.** Every slide is carried by a single bold illustrated metaphor, like the *AI Daily Brief* reference slides. **No generic icon grids, no plain bar charts, no stock clip‑art.**
- **Illustrated, characterful, cinematic** — the deck should feel *designed*, not templated.
- **One concept per slide.** Headline + a few labels, nothing more.
- **Current as of mid‑2026** (see §5). Correct model names and numbers.
- **16:9**, editable afterward in Google Slides / PowerPoint.
- **Slide 9 features the presenter's real stack** (ChatGPT Pro, Claude Pro, Ollama, Hugging Face, OpenClaw, Hermes, the Lobster School project).
- **~9 core slides** (optional title + closing). Pace ≈ 90 sec/slide.

**Reference for style only (do not copy):** the *AI Daily Brief* slides — t‑shirts on a clothesline for hardware sizing, Russian nesting dolls for model sizes, an "app store" storefront for Hugging Face, a framed‑painting comparison for quantization, action‑robots for agents. That **object‑as‑metaphor + a reacting mascot on a dark cinematic background** is the target richness.

---

## 3 · Creative direction (the look & feel)

### The Guide (recurring mascot — recommended)
The reference deck used an owl. **Recommendation: use a lobster** — it's already your brand (Lobster School, OpenClaw "the lobster way 🦞", Forever Lobster). One consistent character across every slide gives the deck its personality and ties to your identity.

> **THE GUIDE:** a distinguished, friendly **lobster professor** — deep red‑orange shell, expressive eyes, wearing a **navy blazer or tweed vest with a small gold pin**. Rendered in a polished **3D/painterly style (Pixar‑meets‑editorial‑illustration)**. He reacts on each slide — pointing, measuring, shopping, presenting. Think "charismatic explainer," not cartoon sidekick.

*(If you'd rather not anthropomorphize, the deck also works mascot‑free — keep the same lighting, palette, and metaphor objects.)*

### Style line (paste into every image prompt)
> `cinematic 3D render, premium editorial tech‑illustration, soft volumetric key light with warm rim light, shallow depth of field, subtle bokeh, rich materials, dramatic dark navy‑to‑charcoal background, color grade of navy + warm gold + teal accents, high detail, 16:9, no text in image`

### Palette
- Background: deep navy → near‑black (`#0B1020 → #06080F`)
- Accent gold `#F5A623` · teal `#3ECF8E` · electric blue `#4A90E2`
- Text: near‑white `#EDEFF7`, muted `#8B92AB`

### Typography (added in Slides/PPT, not in the image)
- **Headline:** a bold condensed grotesque — **Druk, Archivo Black, Anton, or Montserrat ExtraBold**. Big, tight, confident.
- **Labels/body:** **Inter** or **Söhne**. Small, sparse.

### Composition rules
- Hero illustration fills most of the frame; headline sits in a corner or across the top.
- Leave **deliberate negative space** for the headline and 3–6 labels.
- Keep the **light source and the mascot's look identical** slide to slide.
- **Generate art with NO baked‑in text** (type is added later, so it stays editable and crisp).

### Output specs
- 16:9, export hero art at **1920×1080 minimum** (2560×1440 preferred), PNG.
- Final deck: Google Slides or PowerPoint, dark master.

---

## 4 · Slide‑by‑slide spec (recommendations)

> Format per slide → **Purpose · Headline · Subhead · On‑slide labels · HERO PROMPT · Layout**

### ◇ (Optional) Slide 0 — Title
- **Purpose:** set tone, get a laugh.
- **Headline:** `Beyond the Chat Box`
- **Subhead:** *Using AI in real life — what I'm running, how it works, and where to start.*
- **HERO PROMPT:** `[STYLE LINE]. The Guide (lobster professor in navy blazer) stands confidently beside a glowing chalkboard/holographic board in a room that's half cozy classroom, half spaceship bridge, one claw raised as if to begin a talk. Empty board (text added later). Warm spotlight, deep space‑navy background.`
- **Layout:** headline lower‑left, mascot right.

### ◇ Slide 1 — The Map: four layers of "using AI"
- **Purpose:** the spine of the whole talk — everything else hangs off this.
- **Headline:** `It's Just Four Layers`
- **Subhead:** *Every tool and buzzword slots into one of these.*
- **On‑slide labels:** `1 The Model (the brain)` · `2 Where it runs (your device ↔ cloud)` · `3 Get & launch it (Hugging Face · Ollama)` · `4 How you use it (chat ↔ agents)`
- **HERO PROMPT:** `[STYLE LINE]. A majestic four‑tier glowing structure floating in dark space — like a cutaway four‑floor glass tower (or a luxurious four‑layer cake of light), each tier a different accent color (blue, teal, gold, white). Inside each tier, a tiny glowing scene: a luminous brain; a laptop beside a cloud; a download box; a chat bubble next to a small robot. The Guide stands on a floating platform pointing up at the stack with a pointer. Cinematic, awe‑inspiring.`
- **Layout:** tower center/right, headline top‑left, four labels stacked beside their tiers.

### ◇ Slide 2 — Decode the jargon
- **Purpose:** kill the vocabulary fear in one slide.
- **Headline:** `The 9 Words That Unlock Everything`
- **On‑slide labels (term → one‑liner, see §7 for copy):** Parameters · Tokens · Context window · Weights · Open vs closed · Quantization · GGUF · Inference · Agent/harness.
- **HERO PROMPT:** `[STYLE LINE]. The Guide as a friendly codebreaker at a sleek glowing console, holding up a luminous "decoder ring." Behind him, a floating wall of nine softly glowing flash‑cards/tiles arranged in a 3×3 grid, each with a small distinct emblem (no readable text). Spy‑cipher motif but warm and inviting.`
- **Layout:** 3×3 tiles get text labels added in Slides; headline top.

### ◇ Slide 3 — Size = capability
- **Purpose:** "bigger is smarter, but you rarely need the biggest."
- **Headline:** `Bigger Brains — and When You Actually Need One`
- **On‑slide labels:** `1–4B Basic` · `7–14B Capable` · `27–35B Strong (local sweet spot)` · `70B+ Powerful` · `1T+ Frontier (cloud only)`
- **HERO PROMPT:** `[STYLE LINE]. A dramatic stage lineup of five figures growing from tiny to towering, left to right, each on a labeled illuminated podium — e.g., five lobster‑mechs (or glowing brain‑robots) of increasing size, detail, and armor, the largest crackling with energy. Spotlights from above, dark stage, sense of escalating power. (Homage to the nesting‑doll idea, but original.)`
- **Layout:** lineup across the middle, size labels under each, headline top. Banner line: *most daily work runs great on 7–35B.*

### ◇ Slide 4 — Your hardware = your ceiling
- **Purpose:** what *you* can run locally.
- **Headline:** `Your Machine Sets Your Max`
- **On‑slide labels:** `XS Phone/Tablet · 1–3B` · `S Laptop · 3–7B` · `M Desktop+GPU · 27–35B` · `L High‑end Mac/Box · 70B+` · *…or rent the cloud for frontier.*
- **HERO PROMPT (primary — clothesline homage):** `[STYLE LINE]. A clothesline strung across a moody workshop at night, four glowing t‑shirts pinned in sizes XS, S, M, L; beneath each shirt floats the matching device (phone, laptop, desktop tower with GPU, server appliance). The Guide measures one shirt with a tailor's tape, grinning. Warm practical lights.`
- **HERO PROMPT (alt — garage):** `…a moody showroom with four vehicles from scooter → sedan → truck → semi, each badged XS/S/M/L, representing phone→laptop→desktop→appliance.`
- **Layout:** four items in a row, labels below, headline top‑left.

### ◇ Slide 5 — Quantization
- **Purpose:** how a huge model fits a normal machine.
- **Headline:** `Same Model, Pocket‑Sized`
- **On‑slide labels:** `Full quality ≈ 54 GB` → `Q4 ≈ 18 GB (≈30% the size)` · *≈98–99% of the quality. Q4 is the everyday default.*
- **HERO PROMPT:** `[STYLE LINE]. A dark museum gallery. On the left, a colossal ornately gold‑framed landscape painting under a spotlight. On the right, an identical but pocket‑sized framed print of the same landscape. The Guide in a little beret holds the small one up beside the big one, shrugging "looks the same to me." A subtle glowing quality gauge near 99%.`
- **Layout:** big‑vs‑small across frame, size labels under each, headline top.

### ◇ Slide 6 — Where models live
- **Purpose:** Hugging Face = the store; Ollama = the install button.
- **Headline:** `The App Store & the Install Button`
- **On‑slide labels:** `🤗 Hugging Face — 500k+ models, free` · model boxes: *Qwen 3.6, Llama 4 Scout, DeepSeek, Hermes 4.3, gpt‑oss* · `🦙 Ollama — ` `ollama run qwen3.6` · *LM Studio = the click‑not‑type version.*
- **HERO PROMPT:** `[STYLE LINE]. A glowing futuristic storefront at night with a friendly "Hugging Face" marquee; shelves stocked with sleek branded "model" boxes glowing softly. The Guide pushes a shopping basket holding a few model boxes. To the right, a single oversized glowing "INSTALL" button / vending machine labeled with a small terminal window, dispensing one model box. Premium retail‑tech vibe.`
- **Layout:** storefront left, install button right, headline top. (Box brand names as labels in Slides.)

### ◇ Slide 7 — Chat vs. Agents (the big unlock)
- **Purpose:** the single most important idea — going past the chat portal.
- **Headline:** `You Can Talk to It — or Put It to Work`
- **On‑slide labels:** LEFT `Chat: you talk, it answers — ChatGPT, Claude, Open WebUI` · RIGHT `Agents: it takes actions — OpenClaw, Hermes, Claude Code` · loop: `Goal → Plan → Act → Check → ↻`
- **HERO PROMPT:** `[STYLE LINE]. A dramatic split scene. LEFT half, calm and cool‑lit: a person relaxed at a laptop with a single glowing chat speech‑bubble above — passive. RIGHT half, warm and busy with motion: a crew of small lobster‑robots actually doing work — filing documents, flipping a calendar, carrying files, a big glowing "GO" button — energetic and purposeful. The Guide stands on the dividing line, gesturing toward the busy right side.`
- **Layout:** split down the middle, two labels, the agent loop as a small strip along the bottom, headline top.

### ◇ Slide 8 — Cloud vs. Local
- **Purpose:** when to use which; most people use both.
- **Headline:** `Rent the Muscle, Own the Workshop`
- **On‑slide labels:** CLOUD `easiest · most powerful · frontier — but data leaves, costs monthly` · LOCAL `private · free after hardware · offline — but limited by your box, more setup` · *Most of us use both.*
- **HERO PROMPT:** `[STYLE LINE]. Two worlds side by side. LEFT: a towering, cathedral‑like cloud data‑center glowing in the sky — rented, immense, powerful, slightly distant. RIGHT: a cozy private home‑lab workshop on a desk, a small humming server with warm light and a little padlock icon — intimate and secure. The Guide stands between them, one claw extended to each, weighing the choice.`
- **Layout:** two halves, a short pros line under each, headline top.

### ◇ Slide 9 — My stack (show & tell) ★ customize
- **Purpose:** the presenter's real setup; jumping‑off point for a live demo.
- **Headline:** `Here's What I'm Actually Running`
- **On‑slide labels:** `📱 Phone — ChatGPT Pro + Claude Pro` · `💻 Machines — Ollama + Hugging Face (local, private)` · `🤖 Agents — OpenClaw + Hermes (local + cloud)` · `🦞 My project — Lobster School / Mrs. Claw`
- **HERO PROMPT:** `[STYLE LINE]. A sleek personal "command center"/control room. A central glowing hub with three branches of light: a phone, a cluster of desktop/mini‑PCs, and a small swarm of agent‑robots on networked nodes (some local, some in a small cloud). A subtle lobster crest on the wall. The Guide sits at the console as the calm operator. Blueprint‑meets‑cinematic.`
- **Layout:** hub diagram center, four labels around it, headline top. **Swap in your own tools.**

### ◇ (Optional) Slide 10 — Let's talk
- **Purpose:** open the floor.
- **Headline:** `So… What Are You Running?`
- **On‑slide labels:** *What are you using AI for? · Where would 30 min/day back help? · What's stopping you from trying local? · What should we standardize?*
- **HERO PROMPT:** `[STYLE LINE]. A warm round‑table / campfire scene: the Guide and a few small lobster‑robots gathered around a glowing table trading ideas, sparks of light rising like a brainstorm. Inviting, conversational.`
- **Layout:** scene center, prompts as 3–4 short labels, headline top.

---

## 5 · Accuracy reference — facts as of June 2026

**Feed this to GPT so it doesn't use stale names/numbers.**

**Frontier (cloud, closed‑weight):**
- **Claude Opus 4.8** — current overall #1 (SWE‑bench Verified ~88.6%).
- **GPT‑5.5** (OpenAI) · **Gemini 3.1 Pro** (Google) · **Grok 4.3** (xAI).
- Frontier context windows have converged on **~1M tokens**.

**Open / local‑runnable:**
- **Qwen 3.6** — best all‑round local family (1.7B–235B). **27B is the local sweet spot**, Apache‑2.0, fits a 24 GB GPU at Q4.
- **Llama 4 Scout** — context champion (**10M tokens**).
- **gpt‑oss 20B** (OpenAI's open model) — strong on 16 GB machines.
- **Hermes 4.3** (Nous Research) — agent‑tuned, ~36B base, built for local.
- **GLM‑5.1** (coding), **MiniMax M3** (June 2026; coding + 1M ctx + multimodal), **Kimi K2.6** (MoE), **Llama 3.2 3B** (easy 8 GB entry point).

**Tools / layers:**
- **Hugging Face** — the model "app store," 500k+ models; *model card* = spec sheet, *GGUF* = the downloadable file.
- **Ollama** — one‑line local runner (`ollama run qwen3.6`), ~4,500 models in its library.
- **LM Studio** — desktop GUI alternative. **Open WebUI** — self‑hosted ChatGPT‑style front‑end.
- **OpenClaw** — open‑source agent harness; 100k+ GitHub stars in its first months; runs locally, wakes on a schedule, uses "skills" (shell, browser, APIs). Tagline "the lobster way 🦞."
- **Hermes Agent** — Nous Research's open autonomous agent; persistent memory, self‑improving; native desktop app shipped June 2026.
- **Claude Code** — Anthropic's agentic coding harness.

**Handy numbers:**
- Hardware sizing: **XS** phone 1–3B · **S** laptop 3–7B · **M** desktop+GPU 27–35B · **L** high‑end Mac/appliance 70B+.
- Quantization: **Q4 ≈ 30% of full size, ≈98–99% quality** — the everyday default.
- Gartner: **~40% of enterprise apps will include task‑specific AI agents by end of 2026** (up from <5% in 2025).

---

## 6 · Glossary copy (ready‑to‑paste for Slide 2)

- **Parameters (B):** the model's "brain cells," in billions. More = smarter & bigger (7B, 70B…).
- **Tokens:** words chopped into pieces; models read and write in tokens.
- **Context window:** short‑term memory for one chat — now up to ~1M tokens.
- **Weights:** the trained "knowledge" file you download to run a model.
- **Open vs closed:** open = you can run it yourself; closed = API only (GPT, Claude, Gemini).
- **Quantization:** compressing a model to fit your machine; "Q4" is the default.
- **GGUF:** the file format you download to run a model locally.
- **Inference:** a fancy word for "the model running" — actually answering you.
- **Agent / harness:** code wrapped around a model so it can take actions, not just talk.

---

*Prepared as a build spec. Everything except §2 (requirements) and §5 (facts) is a recommendation — change anything.*
