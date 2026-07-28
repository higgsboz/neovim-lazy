return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      eslint = {},
      ruby_lsp = {
        mason = false,
        settings = {
          ruby = {
            useBundler = true,
          },
        },
      },
      sorbet = {
        mason = false,
        cmd = { "bundle", "exec", "srb", "tc", "--lsp" },
      },
    },
  },
}
