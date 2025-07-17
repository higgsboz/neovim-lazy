return {
  "olimorris/codecompanion.nvim",
  opts = {},
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("codecompanion").setup({
      strategies = {
        chat = {
          adapter = "copilot",
          -- model = "claude-3.7-sonnet",
        },
      },
      adapters = {
        copilot = function()
          return require("codecompanion.adapters").extend("copilot", {
            schema = {
              model = {
                default = "claude-3.7-sonnet",
                -- default = "gpt-4.1",
              },
            },
          })
        end,
      },
    })

    vim.cmd([[cab cc CodeCompanion]])
  end,
  keys = {
    { "<C-a>", "<cmd>CodeCompanionActions<cr>", mode = { "n", "v" }, desc = "Trigger CodeCompanion Actions" },
    { "<leader>ac", "<cmd>CodeCompanionChat Toggle<cr>", mode = { "n", "v" }, desc = "Toggle CodeCompanion Chat" },
    { "ga", "<cmd>CodeCompanionChat Add<cr>", mode = "v", desc = "Add to CodeCompanion Chat" },
  },
}
