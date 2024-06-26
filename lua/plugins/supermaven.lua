return {
  "supermaven-inc/supermaven-nvim",
  -- opts = {
  --   keymaps = {
  --     accept_suggestion = "<Tab>",
  --   },
  -- },
  config = function()
    -- require("supermaven-nvim").setup({})
    require("supermaven-nvim").setup({
      -- keymaps = {
      --   accept_suggestion = "<Tab>",
      -- },
    })
  end,
  enabled = false,
}
