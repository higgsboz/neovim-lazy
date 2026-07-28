return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      yamlls = {
        filetypes = { "yaml", "yaml.docker-compose" },
      },
      eslint = {},
      ruby_lsp = {
        mason = false,
        settings = {
          ruby = {
            useBundler = true,
          },
        },
      },
      rubocop = {
        enabled = false,
      },
      sorbet = {
        mason = false,
        cmd = { "bundle", "exec", "srb", "tc", "--lsp" },
      },
    },
  },
}
