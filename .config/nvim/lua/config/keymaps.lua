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
