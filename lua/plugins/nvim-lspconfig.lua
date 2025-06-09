local util = require("lspconfig.util")

return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      eslint = {},
      rubocop = {
        mason = false,
        cmd = { "mise", "x", "--", "rubocop", "--lsp" },
        root_dir = util.root_pattern(".git"),
      },
      ruby_lsp = {
        mason = false,
        cmd = { "/opt/homebrew/bin/mise", "x", "--", "ruby-lsp" },
        root_dir = util.root_pattern(".git"),
        init_options = {
          formatter = "rubocop",
        },
      },
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

-- Possible solution to have erb_lint work with ruby_lsp

-- return {
--   "neovim/nvim-lspconfig",
--   opts = {
--     servers = {
--       -- Your existing configuration
--       ruby_lsp = {
--         mason = false,
--         cmd = { "/opt/homebrew/bin/mise", "x", "--", "ruby-lsp" },
--         root_dir = util.root_pattern(".git"),
--         init_options = {
--           formatter = "rubocop",
--           enabledFeatures = {
--             "codeActions",
--             "diagnostics",
--             "documentHighlights",
--             "documentLink",
--             "documentSymbols",
--             "foldingRanges",
--             "formatting",
--             "hover",
--             "inlayHint",
--             "onTypeFormatting",
--             "selectionRanges",
--             "semanticHighlighting",
--             "completion",
--             "codeLens",
--             "definition",
--             "workspaceSymbol"
--           },
--           -- Add this section to enable ERB-Lint integration
--           experimentalFeaturesEnabled = true,
--           embeddedLanguages = {
--             erb = {
--               enabled = true,
--               formatter = {
--                 command = "/opt/homebrew/bin/mise",
--                 args = { "exec", "ruby", "--", "erb_lint", "--autocorrect", "--stdin", "${INPUT}" },
--               },
--               linter = {
--                 command = "/opt/homebrew/bin/mise",
--                 args = { "exec", "ruby", "--", "erb_lint", "--lint", "${FILE}" },
--               },
--             },
--           },
--         },
--       },
--     },
--   },
-- }
