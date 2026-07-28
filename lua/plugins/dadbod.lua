return {
  "tpope/vim-dadbod",
  dependencies = {
    "kristijanhusak/vim-dadbod-ui",
    "kristijanhusak/vim-dadbod-completion",
  },
  cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection" },
  keys = {
    { "<leader>db", "<cmd>DBUIToggle<cr>", desc = "Toggle DB UI" },
  },
  init = function()
    vim.g.db_ui_use_nerd_fonts = 1
    local ok, dbs = pcall(require, "local.dbs")
    vim.g.dbs = ok and dbs or {}
    vim.g.db_ui_execute_on_save = true
  end,
}
