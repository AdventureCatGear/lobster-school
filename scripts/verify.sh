#!/bin/bash

# 🦞 Lobster School — Installation Verifier
# Checks that all graduation package components are properly installed

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

echo ""
echo -e "${BLUE}🦞 Lobster School — Installation Verifier${NC}"
echo "==========================================="
echo ""

if [ -z "$1" ]; then
    echo -e "${RED}Error: Please provide your OpenClaw workspace path.${NC}"
    echo "Usage: ./verify.sh ~/openclaw"
    exit 1
fi

WORKSPACE="$1"
PASS=0
WARN=0
FAIL=0

check_pass() {
    echo -e "  ${GREEN}✓${NC} $1"
    PASS=$((PASS + 1))
}

check_warn() {
    echo -e "  ${YELLOW}⚠${NC} $1"
    WARN=$((WARN + 1))
}

check_fail() {
    echo -e "  ${RED}✗${NC} $1"
    FAIL=$((FAIL + 1))
}

# Check BOOT.md
echo "Boot Sequence:"
if [ -f "$WORKSPACE/BOOT.md" ]; then
    if grep -q "Lobster School" "$WORKSPACE/BOOT.md"; then
        check_pass "BOOT.md installed with Lobster School boot sequence"
    else
        check_warn "BOOT.md exists but doesn't contain Lobster School content"
    fi
else
    check_fail "BOOT.md not found"
fi

# Check HEARTBEAT.md
echo "Heartbeat:"
if [ -f "$WORKSPACE/HEARTBEAT.md" ]; then
    if grep -q "Lobster School" "$WORKSPACE/HEARTBEAT.md"; then
        check_pass "HEARTBEAT.md installed with Lobster School monitoring"
    else
        check_warn "HEARTBEAT.md exists but doesn't contain Lobster School content"
    fi
else
    check_fail "HEARTBEAT.md not found"
fi

# Check AGENTS.md
echo "Behavioral Rules:"
if [ -f "$WORKSPACE/AGENTS.md" ]; then
    if grep -q "Lobster School Graduate" "$WORKSPACE/AGENTS.md"; then
        check_pass "AGENTS.md contains Lobster School behavioral rules"
    else
        check_warn "AGENTS.md exists but doesn't contain Lobster School rules"
    fi
else
    check_fail "AGENTS.md not found"
fi

# Check diploma skill
echo "Diploma Skill:"
if [ -f "$WORKSPACE/skills/lobster-diploma/SKILL.md" ]; then
    check_pass "lobster-diploma skill installed"
else
    check_fail "lobster-diploma skill not found"
fi

# Check configuration
echo "Security Configuration:"
if [ -f "$WORKSPACE/openclaw.json" ]; then
    # Check key security settings
    if grep -q '"mode": "token"' "$WORKSPACE/openclaw.json" 2>/dev/null || \
       grep -q '"mode":"token"' "$WORKSPACE/openclaw.json" 2>/dev/null; then
        check_pass "Gateway auth token is enabled"
    else
        check_warn "Gateway auth token may not be configured"
    fi
    
    if grep -q '"ask": "always"' "$WORKSPACE/openclaw.json" 2>/dev/null || \
       grep -q '"ask":"always"' "$WORKSPACE/openclaw.json" 2>/dev/null; then
        check_pass "Exec approval is required"
    else
        check_warn "Exec approval may not be configured — shell commands could run without asking"
    fi
    
    if grep -q '"workspaceOnly": true' "$WORKSPACE/openclaw.json" 2>/dev/null || \
       grep -q '"workspaceOnly":true' "$WORKSPACE/openclaw.json" 2>/dev/null; then
        check_pass "Filesystem restricted to workspace"
    else
        check_warn "Filesystem access may not be restricted to workspace"
    fi
else
    check_fail "openclaw.json not found — agent is running with defaults (unsafe)"
fi

# Check hooks are enabled
echo "Hooks:"
if [ -f "$WORKSPACE/openclaw.json" ]; then
    if grep -q '"boot"' "$WORKSPACE/openclaw.json" 2>/dev/null; then
        check_pass "Boot hook is configured"
    else
        check_warn "Boot hook may not be enabled in openclaw.json"
    fi
    
    if grep -q '"heartbeat"' "$WORKSPACE/openclaw.json" 2>/dev/null; then
        check_pass "Heartbeat hook is configured"
    else
        check_warn "Heartbeat hook may not be enabled in openclaw.json"
    fi
fi

# Check memory directory
echo "Memory:"
if [ -d "$WORKSPACE/memory" ]; then
    check_pass "Memory directory exists"
else
    check_warn "Memory directory not found — creating it"
    mkdir -p "$WORKSPACE/memory"
fi

# Check core identity files
echo "Identity Files:"
if [ -f "$WORKSPACE/SOUL.md" ]; then
    check_pass "SOUL.md exists"
else
    check_warn "SOUL.md not found — your agent doesn't know who it is"
fi

if [ -f "$WORKSPACE/USER.md" ]; then
    check_pass "USER.md exists"
else
    check_warn "USER.md not found — your agent doesn't know who you are"
fi

# Summary
echo ""
echo "==========================================="
echo -e "Results: ${GREEN}$PASS passed${NC}, ${YELLOW}$WARN warnings${NC}, ${RED}$FAIL failed${NC}"
echo "==========================================="

if [ $FAIL -eq 0 ] && [ $WARN -eq 0 ]; then
    echo -e "${GREEN}🦞 Perfect score! Your agent is fully graduated.${NC}"
elif [ $FAIL -eq 0 ]; then
    echo -e "${YELLOW}🦞 Graduation package installed with some warnings. Review above.${NC}"
else
    echo -e "${RED}🦞 Some components are missing. Run install.sh to fix.${NC}"
fi
echo ""
