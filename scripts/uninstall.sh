#!/bin/bash

# 🦞 Lobster School — Uninstaller
# Restores your OpenClaw workspace from the most recent backup

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

echo ""
echo -e "${BLUE}🦞 Lobster School — Uninstaller${NC}"
echo "================================"
echo ""

if [ -z "$1" ]; then
    echo -e "${RED}Error: Please provide your OpenClaw workspace path.${NC}"
    echo "Usage: ./uninstall.sh ~/openclaw"
    exit 1
fi

WORKSPACE="$1"
BACKUP_BASE="$WORKSPACE/.lobster-backup"

if [ ! -d "$BACKUP_BASE" ]; then
    echo -e "${RED}Error: No Lobster School backup found in $WORKSPACE${NC}"
    echo "Cannot uninstall without a backup to restore from."
    exit 1
fi

# Find most recent backup
LATEST_BACKUP=$(ls -td "$BACKUP_BASE"/*/ 2>/dev/null | head -1)

if [ -z "$LATEST_BACKUP" ]; then
    echo -e "${RED}Error: No backup directories found.${NC}"
    exit 1
fi

echo -e "${GREEN}Restoring from:${NC} $LATEST_BACKUP"
echo ""

read -p "This will restore your pre-Lobster-School configuration. Continue? (y/N): " confirm
if [ "$confirm" != "y" ] && [ "$confirm" != "Y" ]; then
    echo "Aborted."
    exit 0
fi

# Restore backed up files
for file in BOOT.md HEARTBEAT.md AGENTS.md openclaw.json; do
    if [ -f "$LATEST_BACKUP/$file" ]; then
        cp "$LATEST_BACKUP/$file" "$WORKSPACE/$file"
        echo "  Restored: $file"
    elif [ -f "$WORKSPACE/$file" ]; then
        # File didn't exist before, but exists now — only remove if it's ours
        if grep -q "Lobster School" "$WORKSPACE/$file" 2>/dev/null; then
            rm "$WORKSPACE/$file"
            echo "  Removed: $file (didn't exist before installation)"
        fi
    fi
done

# Remove diploma skill
if [ -d "$WORKSPACE/skills/lobster-diploma" ]; then
    rm -rf "$WORKSPACE/skills/lobster-diploma"
    echo "  Removed: skills/lobster-diploma/"
fi

# Remove hardened config reference
if [ -f "$WORKSPACE/openclaw-hardened.json" ]; then
    rm "$WORKSPACE/openclaw-hardened.json"
    echo "  Removed: openclaw-hardened.json"
fi

# Remove installation record
if [ -f "$WORKSPACE/.lobster-school" ]; then
    rm "$WORKSPACE/.lobster-school"
    echo "  Removed: .lobster-school"
fi

echo ""
echo -e "${GREEN}✓ Lobster School uninstalled. Original configuration restored.${NC}"
echo ""
echo "Restart your OpenClaw agent to apply the restored configuration."
echo ""
