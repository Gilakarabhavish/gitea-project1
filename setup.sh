#!/usr/bin/env bash

# Task 2 - Automate Local Gitea Project Setup

set -e

echo "========================================"
echo "   Gitea Local Setup Automation"
echo "========================================"
echo

# ----------------------------------------
# Function to check required commands
# ----------------------------------------

check_command() {
    if command -v "$1" >/dev/null 2>&1; then
        echo "[OK] $1 is installed"
    else
        echo "[ERROR] $1 is not installed or not available in PATH"
        exit 1
    fi
}

# ----------------------------------------
# Check required tools
# ----------------------------------------

echo "[1/7] Checking required tools..."

check_command git
check_command go
check_command node
check_command pnpm
check_command make
check_command curl

echo

# ----------------------------------------
# Display tool versions
# ----------------------------------------

echo "[2/7] Displaying dependency versions..."

echo "Git:    $(git --version)"
echo "Go:     $(go version)"
echo "Node:   $(node --version)"
echo "pnpm:   $(pnpm --version)"
echo "Make:   $(make --version | head -n 1)"
echo "curl:   $(curl --version | head -n 1)"

echo

# ----------------------------------------
# Verify Gitea project directory
# ----------------------------------------

echo "[3/7] Verifying Gitea project directory..."

if [[ ! -f "go.mod" ]] || \
   [[ ! -f "Makefile" ]] || \
   [[ ! -f "main.go" ]]; then

    echo "[ERROR] This script must be run from the Gitea project root directory."
    echo "Please run the script from the directory containing go.mod, Makefile, and main.go."
    exit 1
fi

echo "[OK] Correct Gitea project directory detected."

echo

# ----------------------------------------
# Build Gitea
# ----------------------------------------

echo "[4/7] Building Gitea from source..."

if ! make build; then
    echo "[ERROR] Gitea build failed."
    exit 1
fi

echo "[OK] Gitea build completed successfully."

echo

# ----------------------------------------
# Verify Gitea binary
# ----------------------------------------

echo "[5/7] Verifying Gitea binary..."

if [[ -f "gitea.exe" ]]; then
    echo "[OK] Gitea binary found: gitea.exe"
elif [[ -f "gitea" ]]; then
    echo "[OK] Gitea binary found: gitea"
else
    echo "[ERROR] Gitea binary was not created."
    exit 1
fi

echo

# ----------------------------------------
# Check port 3000
# ----------------------------------------

echo "[6/7] Checking port 3000..."

if command -v netstat >/dev/null 2>&1; then
    if netstat -ano 2>/dev/null | grep -q ":3000.*LISTEN"; then
        echo "[ERROR] Port 3000 is already in use."
        echo "Please stop the application using port 3000 and try again."
        exit 1
    fi
fi

echo "[OK] Port 3000 is available."

echo

# ----------------------------------------
# Start Gitea
# ----------------------------------------

echo "[7/7] Starting Gitea web server..."
echo
echo "Gitea will be available at:"
echo "http://localhost:3000"
echo
echo "Press Ctrl+C to stop the server."
echo

if [[ -f "gitea.exe" ]]; then
    ./gitea.exe web
else
    ./gitea web
fi