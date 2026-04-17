return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      eslint = {},
      ruby_lsp = {
        mason = false,
        cmd = {
          "mise",
          "x",
          "ruby",
          "--",
          "ruby-lsp",
        },
        -- root_dir = require("lspconfig.util").root_pattern("Gemfile", ".ruby-version", ".tool-versions", ".git"),
        settings = {
          ruby = {
            useBundler = true,
          },
        },
      },
    },
    -- servers = {
    --   eslint = {},
    --   ruby_lsp = {
    --     mason = false,
    --     -- Use the globally installed ruby-lsp from mise, not through bundler
    --     cmd = { "mise", "x", "ruby", "--", "ruby-lsp" },
    --     root_dir = util.root_pattern("Gemfile", ".ruby-version", ".tool-versions", ".git"),
    --     -- root_markers = { "Gemfile", ".ruby-version", ".tool-versions", ".git" },
    --     init_options = {
    --       -- Use auto formatter detection to pick up local RuboCop config
    --       formatter = "auto",
    --       linters = { "rubocop" },
    --     },
    --     settings = {
    --       rubyLsp = {
    --         -- Enable experimental features for better functionality
    --         experimentalFeaturesEnabled = true,
    --         -- Ensure RuboCop uses local configuration and bundled version
    --         rubocop = {
    --           -- Use bundler to ensure we get the project's RuboCop version
    --           useBundlerForRubocop = true,
    --           -- Disable RuboCop server to avoid version conflicts
    --           safeAutocorrect = false,
    --         },
    --       },
    --     },
    --   },
    -- },
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
