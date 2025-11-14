#!/bin/bash

# Script to set up Ruby LSP for the current Ruby environment
# This ensures ruby-lsp and common gems are available in any Ruby version

set -e

echo "Setting up Ruby LSP for current environment..."

# Get current Ruby version
RUBY_VERSION=$(mise current ruby 2>/dev/null || echo "none")

if [ "$RUBY_VERSION" = "none" ]; then
    echo "No Ruby version detected. Please ensure mise is configured with a Ruby version."
    exit 1
fi

echo "Current Ruby version: $RUBY_VERSION"

# Install essential gems for LSP functionality
echo "Installing ruby-lsp..."
mise x -- gem install ruby-lsp

echo "Installing rubocop (if not already installed)..."
mise x -- gem install rubocop || true

echo "Installing sablon (required for some RuboCop configs like beam-style)..."
mise x -- gem install sablon -v 0.4.2 || true

echo "Installing erb_lint (for ERB files)..."
mise x -- gem install erb_lint || true

echo "Stopping any existing RuboCop servers..."
mise x -- rubocop --stop-server || true

echo "Cleaning up any existing Ruby LSP cache..."
rm -rf .ruby-lsp || true

echo "Ruby LSP setup complete for Ruby $RUBY_VERSION!"
echo "You can now use Ruby LSP in Neovim for this project."
