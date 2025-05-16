-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set(
  "n",
  "<leader>id",
  "i<C-r>=strftime('%Y-%m-%d %H:%M:%S')<CR><Esc>",
  { desc = "Insert Datetime", silent = true }
)

vim.keymap.set(
  "v",
  "<leader>id",
  "c<C-r>=strftime('%Y-%m-%d %H:%M:%S')<CR><Esc>",
  { desc = "Insert Datetime", silent = true }
)
