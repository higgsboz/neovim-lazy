return {
  "stevearc/oil.nvim",
  opts = {
    default_file_explorer = true,
    float = {
      padding = 10,
    },
    keymaps = {
      ["<ESC><ESC>"] = "actions.close",
      ["q"] = "actions.close",
    },
  },
  dependencies = { "nvim-tree/nvim-web-devicons" },
}
