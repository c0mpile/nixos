#!/usr/bin/env bash

set -euo pipefail

echo "🚀 Deploying NixOS with Home Manager from ~/nixos"

# Ensure we're in the right directory
if [[ ! -f "flake.nix" ]]; then
  echo "❌ Error: flake.nix not found in current directory"
  exit 1
fi

# Build and activate system
echo "📦 Building system configuration..."
sudo nixos-rebuild switch --flake .#desktop

echo "✅ System deployed successfully!"
