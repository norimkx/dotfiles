if vim.fn.executable("zenhan.exe") == 1 then
  vim.api.nvim_create_autocmd({ "InsertLeave", "CmdlineLeave" }, {
    group = vim.api.nvim_create_augroup("zenhan", {}),
    command = 'call system("zenhan.exe 0")',
  })
end
