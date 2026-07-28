return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      sources = {
        -- files = { exclude = { "sorbet" } },
        grep = { exclude = { "sorbet" } },
        -- explorer = { exclude = { "sorbet" } },
      },
    },
  },
  keys = {
    {
      "<leader><space>",
      function()
        Snacks.picker.files({ root = false })
      end,
      desc = "Find Files (cwd)",
    },
    {
      "<leader>/",
      function()
        Snacks.picker.grep({ root = false })
      end,
      desc = "Grep (cwd)",
    },
  },
}
