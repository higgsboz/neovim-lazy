-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local nvim_tmux_nav = require("nvim-tmux-navigation")

vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })

vim.keymap.set("n", "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
vim.keymap.set("n", "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
vim.keymap.set("n", "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
vim.keymap.set("n", "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
vim.keymap.set("n", "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
vim.keymap.set("n", "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)

-- vim.keymap.set("n", "<leader>fp", function()
--   local filepath = vim.fn.expand("%:p")
--   vim.fn.setreg("+", filepath)
--   print("Copied to clipboard: " .. filepath)
-- end, { desc = "Copy filepath to clipboard" })

vim.keymap.set("n", "<leader>fp", function()
  local filepath = vim.fn.expand("%:.")
  vim.fn.setreg("+", filepath)
  print("Copied to clipboard: " .. filepath)
end, { desc = "Copy repo path to clipboard" })

-- Resize window using Meta + arrow keys
vim.keymap.set("n", "<M-7>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
vim.keymap.set("n", "<M-8>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
vim.keymap.set("n", "<M-9>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
vim.keymap.set("n", "<M-0>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })
