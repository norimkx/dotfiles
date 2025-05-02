-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

if vim.fn.has("wsl") == 1 then
  vim.api.nvim_create_autocmd({ "InsertLeave", "CmdlineLeave" }, {
    command = 'call system("zenhan.exe 0")',
  })
end

vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    local organize_imports_action = LazyVim.lsp.action["source.organizeImports"]
    if organize_imports_action then
      organize_imports_action()
    end
  end,
})
