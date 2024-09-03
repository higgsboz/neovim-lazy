-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local nvim_tmux_nav = require("nvim-tmux-navigation")

vim.keymap.set("n", "<leader>source", ":luafile ~/.config/nvim/init.lua<CR>")
vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })

vim.keymap.set("n", "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
vim.keymap.set("n", "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
vim.keymap.set("n", "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
vim.keymap.set("n", "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
vim.keymap.set("n", "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
vim.keymap.set("n", "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)

vim.keymap.set("n", "<leader>fz", function()
  LazyVim.terminal(nil, { cwd = vim.fn.expand("%:p:h") })
end, { desc = "Terminal (current file)" })

vim.keymap.set("n", "<leader>fp", function()
  local filepath = vim.fn.expand("%:p")
  vim.fn.setreg("+", filepath)
  print("Copied to clipboard: " .. filepath)
end, { desc = "Copy filepath to clipboard" })

-- Resize window using Meta + arrow keys
vim.keymap.set("n", "7", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
vim.keymap.set("n", "8", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
vim.keymap.set("n", "9", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
vim.keymap.set("n", "0", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- Ufo
local ufo = require("ufo")
vim.keymap.set("n", "zR", ufo.openAllFolds, { desc = "Open all folds" })
vim.keymap.set("n", "zM", ufo.closeAllFolds, { desc = "Close all folds" })
vim.keymap.set("n", "zr", ufo.openFoldsExceptKinds, { desc = "Fold less" })
vim.keymap.set("n", "zm", ufo.closeFoldsWith, { desc = "Fold more" })
vim.keymap.set("n", "zK", function()
  local winid = ufo.peekFoldedLinesUnderCursor()
  if not winid then
    vim.lsp.buf.hover()
  end
end, { desc = "Peek Fold" })
