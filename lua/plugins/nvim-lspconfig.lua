local util = require("lspconfig.util")

return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      eslint = {},
      ruby_lsp = {
        root_dir = util.root_pattern(".git"),
        init_options = {
          formatter = "rubocop",
        },
      },
      solargraph = {
        enabled = false,
      },
      -- pyright = {},
    },
    setup = {
      eslint = function()
        require("lazyvim.util").lsp.on_attach(function(client)
          if client.name == "eslint" then
            client.server_capabilities.documentFormattingProvider = true
          elseif client.name == "tsserver" then
            client.server_capabilities.documentFormattingProvider = false
          end
        end)
      end,
    },
  },
}
