return {
  "stevearc/oil.nvim",
  opts = {
    default_file_explorer = true,
    float = {
      padding = 10,
    },
    win_options = {
      winbar = "%{fnamemodify(v:lua.require('oil').get_current_dir(), ':~:.')}",
    },
    keymaps = {
      ["<ESC><ESC>"] = "actions.close",
      ["q"] = "actions.close",
    },
  },
  dependencies = { "nvim-tree/nvim-web-devicons" },
}
