#!/bin/bash

# ============================================
# 🦞 Lobster School — Graduation Package Installer
# ============================================
# 
# This script installs the Lobster School graduation package
# into your OpenClaw workspace. It:
#   1. Backs up your current configuration
#   2. Installs BOOT.md and HEARTBEAT.md hooks
#   3. Appends behavioral rules to AGENTS.md
#   4. Installs the hardened openclaw.json (or merges key settings)
#   5. Installs the lobster-diploma skill
#
# Usage: ./install.sh /path/to/your/openclaw/workspace
#
# Everything is backed up to a .lobster-backup/ folder
# before any changes are made. Run uninstall.sh to revert.
# ============================================

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo ""
echo -e "${BLUE}🦞 Lobster School — Graduation Package Installer${NC}"
echo "================================================="
echo ""

# Check for workspace argument
if [ -z "$1" ]; then
    echo -e "${RED}Error: Please provide your OpenClaw workspace path.${NC}"
    echo ""
    echo "Usage: ./install.sh ~/openclaw"
    echo "  or:  ./install.sh ~/clawd"
    echo ""
    echo "Your workspace is usually ~/openclaw or ~/clawd — it's the folder"
    echo "that contains your SOUL.md, AGENTS.md, and other agent files."
    exit 1
fi

WORKSPACE="$1"
SCRIPT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
GRAD_DIR="$SCRIPT_DIR/graduation-package"
BACKUP_DIR="$WORKSPACE/.lobster-backup/$(date +%Y%m%d_%H%M%S)"
TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

# Verify workspace exists
if [ ! -d "$WORKSPACE" ]; then
    echo -e "${RED}Error: Workspace directory not found: $WORKSPACE${NC}"
    echo "Make sure this is the correct path to your OpenClaw workspace."
    exit 1
fi

# Verify it looks like an OpenClaw workspace
if [ ! -f "$WORKSPACE/SOUL.md" ] && [ ! -f "$WORKSPACE/AGENTS.md" ]; then
    echo -e "${YELLOW}Warning: This doesn't look like an OpenClaw workspace.${NC}"
    echo "Expected to find SOUL.md or AGENTS.md in $WORKSPACE"
    echo ""
    read -p "Continue anyway? (y/N): " confirm
    if [ "$confirm" != "y" ] && [ "$confirm" != "Y" ]; then
        echo "Aborted."
        exit 0
    fi
fi

# Check graduation package exists
if [ ! -d "$GRAD_DIR" ]; then
    echo -e "${RED}Error: Graduation package not found at $GRAD_DIR${NC}"
    echo "Make sure you're running this from the lobster-school directory."
    exit 1
fi

echo -e "${GREEN}Workspace:${NC} $WORKSPACE"
echo -e "${GREEN}Backup to:${NC} $BACKUP_DIR"
echo ""

# ============================================
# Step 1: Create backup
# ============================================
echo -e "${BLUE}Step 1: Backing up current configuration...${NC}"

mkdir -p "$BACKUP_DIR"

for file in BOOT.md HEARTBEAT.md AGENTS.md openclaw.json; do
    if [ -f "$WORKSPACE/$file" ]; then
        cp "$WORKSPACE/$file" "$BACKUP_DIR/$file"
        echo "  Backed up: $file"
    fi
done

# Backup existing skills if the diploma skill already exists
if [ -d "$WORKSPACE/skills/lobster-diploma" ]; then
    mkdir -p "$BACKUP_DIR/skills"
    cp -r "$WORKSPACE/skills/lobster-diploma" "$BACKUP_DIR/skills/"
    echo "  Backed up: skills/lobster-diploma/"
fi

echo -e "${GREEN}  ✓ Backup complete${NC}"
echo ""

# ============================================
# Step 2: Install BOOT.md
# ============================================
echo -e "${BLUE}Step 2: Installing BOOT.md (session start hook)...${NC}"

if [ -f "$WORKSPACE/BOOT.md" ]; then
    # Check if it already has Lobster School content
    if grep -q "Lobster School" "$WORKSPACE/BOOT.md"; then
        echo -e "${YELLOW}  BOOT.md already contains Lobster School content. Replacing...${NC}"
    else
        echo "  Existing BOOT.md found. Prepending Lobster School boot sequence..."
        # Prepend our boot sequence before existing content
        cat "$GRAD_DIR/BOOT.md" > "$WORKSPACE/BOOT.md.tmp"
        echo "" >> "$WORKSPACE/BOOT.md.tmp"
        echo "---" >> "$WORKSPACE/BOOT.md.tmp"
        echo "" >> "$WORKSPACE/BOOT.md.tmp"
        echo "## Your Original Boot Instructions" >> "$WORKSPACE/BOOT.md.tmp"
        echo "" >> "$WORKSPACE/BOOT.md.tmp"
        cat "$WORKSPACE/BOOT.md" >> "$WORKSPACE/BOOT.md.tmp"
        mv "$WORKSPACE/BOOT.md.tmp" "$WORKSPACE/BOOT.md"
        echo -e "${GREEN}  ✓ BOOT.md updated (original content preserved)${NC}"
        echo ""
        # Skip the copy below
        BOOT_DONE=true
    fi
fi

if [ -z "$BOOT_DONE" ]; then
    cp "$GRAD_DIR/BOOT.md" "$WORKSPACE/BOOT.md"
    echo -e "${GREEN}  ✓ BOOT.md installed${NC}"
fi
echo ""

# ============================================
# Step 3: Install HEARTBEAT.md
# ============================================
echo -e "${BLUE}Step 3: Installing HEARTBEAT.md (periodic monitoring)...${NC}"

if [ -f "$WORKSPACE/HEARTBEAT.md" ]; then
    if grep -q "Lobster School" "$WORKSPACE/HEARTBEAT.md"; then
        echo -e "${YELLOW}  HEARTBEAT.md already contains Lobster School content. Replacing...${NC}"
    else
        echo "  Existing HEARTBEAT.md found. Appending Lobster School heartbeat..."
        echo "" >> "$WORKSPACE/HEARTBEAT.md"
        echo "---" >> "$WORKSPACE/HEARTBEAT.md"
        echo "" >> "$WORKSPACE/HEARTBEAT.md"
        cat "$GRAD_DIR/HEARTBEAT.md" >> "$WORKSPACE/HEARTBEAT.md"
        echo -e "${GREEN}  ✓ HEARTBEAT.md updated (original content preserved)${NC}"
        echo ""
        HEARTBEAT_DONE=true
    fi
fi

if [ -z "$HEARTBEAT_DONE" ]; then
    cp "$GRAD_DIR/HEARTBEAT.md" "$WORKSPACE/HEARTBEAT.md"
    echo -e "${GREEN}  ✓ HEARTBEAT.md installed${NC}"
fi
echo ""

# ============================================
# Step 4: Append behavioral rules to AGENTS.md
# ============================================
echo -e "${BLUE}Step 4: Adding behavioral rules to AGENTS.md...${NC}"

if [ -f "$WORKSPACE/AGENTS.md" ]; then
    if grep -q "Lobster School Graduate" "$WORKSPACE/AGENTS.md"; then
        echo -e "${YELLOW}  AGENTS.md already contains Lobster School rules. Skipping.${NC}"
    else
        echo "" >> "$WORKSPACE/AGENTS.md"
        echo "" >> "$WORKSPACE/AGENTS.md"
        echo "---" >> "$WORKSPACE/AGENTS.md"
        echo "" >> "$WORKSPACE/AGENTS.md"
        cat "$GRAD_DIR/agents-lobster-addendum.md" >> "$WORKSPACE/AGENTS.md"
        echo -e "${GREEN}  ✓ Behavioral rules appended to AGENTS.md${NC}"
    fi
else
    cp "$GRAD_DIR/agents-lobster-addendum.md" "$WORKSPACE/AGENTS.md"
    echo -e "${GREEN}  ✓ AGENTS.md created with Lobster School rules${NC}"
fi
echo ""

# ============================================
# Step 5: Install hardened configuration
# ============================================
echo -e "${BLUE}Step 5: Installing hardened configuration...${NC}"

if [ -f "$WORKSPACE/openclaw.json" ]; then
    echo -e "${YELLOW}  Existing openclaw.json found.${NC}"
    echo "  Your current config has been backed up."
    echo "  The hardened config is saved as openclaw-hardened.json for reference."
    echo ""
    echo -e "${YELLOW}  ⚠ IMPORTANT: Review openclaw-hardened.json and manually merge${NC}"
    echo -e "${YELLOW}    the security settings you want. Key settings to adopt:${NC}"
    echo "    - gateway.auth.mode: \"token\" (requires auth)"
    echo "    - tools.exec.ask: \"always\" (approval for shell commands)"
    echo "    - tools.fs.workspaceOnly: true (restrict file access)"
    echo "    - channels.*.dmPolicy: \"pairing\" (restrict DMs)"
    echo "    - hooks.boot.enabled: true (enable BOOT.md)"
    echo "    - hooks.heartbeat.enabled: true (enable HEARTBEAT.md)"
    echo ""
    cp "$GRAD_DIR/openclaw-hardened.json" "$WORKSPACE/openclaw-hardened.json"
    echo -e "${GREEN}  ✓ openclaw-hardened.json saved for reference${NC}"
else
    # Generate a random token
    TOKEN=$(openssl rand -hex 32 2>/dev/null || head -c 64 /dev/urandom | od -A n -t x1 | tr -d ' \n' | head -c 64)
    sed "s/REPLACE_WITH_STRONG_RANDOM_TOKEN/$TOKEN/" "$GRAD_DIR/openclaw-hardened.json" > "$WORKSPACE/openclaw.json"
    echo -e "${GREEN}  ✓ openclaw.json installed with generated auth token${NC}"
    echo -e "${YELLOW}  Your gateway auth token: $TOKEN${NC}"
    echo "  Save this somewhere safe — you'll need it to connect to your agent."
fi
echo ""

# ============================================
# Step 6: Install diploma skill
# ============================================
echo -e "${BLUE}Step 6: Installing lobster-diploma skill...${NC}"

mkdir -p "$WORKSPACE/skills/lobster-diploma"
cp "$GRAD_DIR/lobster-diploma/SKILL.md" "$WORKSPACE/skills/lobster-diploma/SKILL.md"
echo -e "${GREEN}  ✓ lobster-diploma skill installed${NC}"
echo ""

# ============================================
# Step 7: Create memory directory if needed
# ============================================
echo -e "${BLUE}Step 7: Ensuring memory directory exists...${NC}"

mkdir -p "$WORKSPACE/memory"
echo -e "${GREEN}  ✓ memory/ directory ready${NC}"
echo ""

# ============================================
# Step 8: Write installation record
# ============================================
echo -e "${BLUE}Step 8: Writing installation record...${NC}"

cat > "$WORKSPACE/.lobster-school" << EOF
{
  "installed_at": "$TIMESTAMP",
  "version": "1.0.0",
  "backup_location": "$BACKUP_DIR",
  "components": [
    "BOOT.md",
    "HEARTBEAT.md",
    "agents-lobster-addendum (appended to AGENTS.md)",
    "openclaw-hardened.json",
    "skills/lobster-diploma/SKILL.md"
  ]
}
EOF
echo -e "${GREEN}  ✓ Installation record saved${NC}"
echo ""

# ============================================
# Done!
# ============================================
echo "================================================="
echo -e "${GREEN}🦞 Graduation package installed successfully!${NC}"
echo "================================================="
echo ""
echo "What was installed:"
echo "  ✓ BOOT.md          — Wake-up ritual (runs every session start)"
echo "  ✓ HEARTBEAT.md     — Periodic monitoring (memory, integrity, health)"
echo "  ✓ AGENTS.md        — Behavioral rules (source verification, action safety)"
echo "  ✓ Config            — Hardened security defaults"
echo "  ✓ lobster-diploma   — Quick-reference decision skill"
echo ""
echo "Your backup is at: $BACKUP_DIR"
echo "To undo everything: ./scripts/uninstall.sh $WORKSPACE"
echo ""
if [ -f "$WORKSPACE/openclaw-hardened.json" ] && [ -f "$WORKSPACE/openclaw.json" ]; then
    echo -e "${YELLOW}⚠ ACTION NEEDED: Merge security settings from openclaw-hardened.json${NC}"
    echo "  into your existing openclaw.json. See the settings listed above."
    echo ""
fi
echo -e "${BLUE}Next step: Restart your OpenClaw agent to activate the new hooks.${NC}"
echo ""
echo "Your agent will run the boot sequence on its next session start."
echo "Welcome to Lobster School. 🦞"
echo ""
