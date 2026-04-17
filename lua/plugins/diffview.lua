return {
  "sindrets/diffview.nvim",
  lazy = false,
  keys = {
    { ",hh", "<cmd>DiffviewFileHistory<CR>", desc = "Repo History" },
    { ",hf", "<cmd>DiffviewFileHistory --follow %<CR>", desc = "File History" },
    { ",hl", "<Esc><Cmd>'<,'>DiffviewFileHistory --follow<CR>", desc = "Range History", mode = "v" },
    { ",hl", "<Cmd>.DiffviewFileHistory --follow<CR>", desc = "Line History", mode = "n" },
    { ",d", "<cmd>DiffviewOpen<CR>", desc = "Repo Diff" },
    {
      ",hm",
      "<Cmd>DiffviewOpen HEAD..origin/develop<CR>",
      desc = "Diff Against Develop",
    },
    -- {
    --   ",hM",
    --   function()
    --     vim.cmd("DiffviewOpen HEAD..origin/" .. get_default_branch_name())
    --   end,
    --   desc = "Diff Against Origin/Master",
    -- },
    { ",d", "<cmd>DiffviewOpen<CR>", desc = "Repo Diff" },
    { ",x", "<cmd>DiffviewClose<CR>", desc = "Close Diff View" },
  },
}
