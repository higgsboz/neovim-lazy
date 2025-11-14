# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

## Ruby LSP Setup

This configuration uses `mise` to manage Ruby versions and automatically detects the correct Ruby environment for each project.

### Initial Setup

For each Ruby project where you want to use the LSP, run:

```bash
# Navigate to your project directory
cd ~/repos/your-ruby-project

# Run the setup script
~/.config/nvim/scripts/setup-ruby-lsp.sh
```

This will install `ruby-lsp`, `rubocop`, `sablon`, and `erb_lint` in the current Ruby environment.

### Manual Setup

Alternatively, you can manually install the required gems:

```bash
cd ~/repos/your-ruby-project
mise x -- gem install ruby-lsp rubocop sablon erb_lint
mise x -- rubocop --stop-server  # Stop any existing RuboCop servers
rm -rf .ruby-lsp  # Clean up Ruby LSP cache
```

### How It Works

- The LSP configuration uses `mise x -- ruby-lsp` which automatically uses the Ruby version specified in your project
- Root directory detection looks for `Gemfile`, `.ruby-version`, `.tool-versions`, or `.git`
- Each Ruby environment needs its own installation of `ruby-lsp` and related gems

### Troubleshooting

**Missing sablon gem error**: If you see "Could not find sablon-0.4.2 in locally installed gems", run:
```bash
cd ~/repos/your-ruby-project
mise x -- gem install sablon -v 0.4.2
```

**RuboCop Deprecation Warnings**: You may see warnings like:
```
rubocop-performance extension supports plugin, specify `plugins: rubocop-performance` instead of `require: rubocop-performance`
```

These are harmless deprecation warnings from RuboCop configuration files (often from gems like `beam-style`). The Ruby LSP is working correctly despite these warnings.

**LSP conflicts**: The configuration now uses Ruby LSP's internal RuboCop integration instead of running a separate RuboCop LSP server to avoid conflicts.
