return {
  "mason-org/mason.nvim",
  opts = {
    ensure_installed = {
      "stylua",
      "shellcheck",
      "shfmt",
      "flake8",
    },
    -- Explicitly specify formatters that should NOT be managed by Mason
    not_installed = {
      "erb-formatter", -- This will be managed through mise instead
    },
  },
}
