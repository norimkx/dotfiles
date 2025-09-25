-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.linebreak = false
opt.spelllang = { "en", "cjk" }

vim.env.JAVA_HOME = "/home/linuxbrew/.linuxbrew/opt/openjdk@21"
