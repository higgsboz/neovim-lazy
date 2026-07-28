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
    setup = {
      eslint = function()
        vim.api.nvim_create_autocmd("LspAttach", {
          callback = function(args)
            local client = vim.lsp.get_client_by_id(args.data.client_id)
            if client and client.name == "eslint" then
              client.server_capabilities.documentFormattingProvider = true
            elseif client and client.name == "tsserver" then
              client.server_capabilities.documentFormattingProvider = false
            end
          end,
        })
      end,
    },
  },
}
